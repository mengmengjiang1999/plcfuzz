#!/usr/bin/env python3
"""Build deterministic multi-run reports from evaluation experiment directories."""

import argparse
import csv
import hashlib
import html
import io
import json
import math
import os
import pathlib
import random
import statistics
import tempfile

from evaluation_protocol import TRIAL_METRICS, load_json, sha256_file, validate_protocol, validate_result


REPORT_SCHEMA = "PLC_LAB_EXPERIMENT_REPORT_V1"
CSV_FIELDS = (
    "benchmark_id", "strategy_id", "metric_id", "count", "mean", "median",
    "sample_standard_deviation", "minimum", "maximum", "interval_95_low", "interval_95_high",
)
BOOTSTRAP_RESAMPLES = 2000


def require(condition, message):
    if not condition:
        raise ValueError(message)


def atomic_write(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    handle, temporary_name = tempfile.mkstemp(prefix=path.name + ".", dir=str(path.parent))
    try:
        with os.fdopen(handle, "wb") as stream:
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary_name, str(path))
    except Exception:
        try:
            os.unlink(temporary_name)
        except OSError:
            pass
        raise


def json_bytes(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode("utf-8")


def percentile(sorted_values, fraction):
    if len(sorted_values) == 1:
        return sorted_values[0]
    position = (len(sorted_values) - 1) * fraction
    lower = int(math.floor(position))
    upper = int(math.ceil(position))
    if lower == upper:
        return sorted_values[lower]
    weight = position - lower
    return sorted_values[lower] * (1.0 - weight) + sorted_values[upper] * weight


def aggregate_values(values, group_key):
    require(values, "cannot aggregate an empty value list")
    numeric = [float(value) for value in values]
    mean_value = statistics.mean(numeric)
    median_value = statistics.median(numeric)
    deviation = statistics.stdev(numeric) if len(numeric) > 1 else None
    if len(numeric) == 1:
        interval = [numeric[0], numeric[0]]
    else:
        seed = int(hashlib.sha256("\0".join(group_key).encode("utf-8")).hexdigest()[:16], 16)
        generator = random.Random(seed)
        bootstrap = sorted(
            statistics.mean(generator.choice(numeric) for _ in numeric)
            for _ in range(BOOTSTRAP_RESAMPLES)
        )
        interval = [percentile(bootstrap, 0.025), percentile(bootstrap, 0.975)]
    return {
        "count": len(values),
        "values": values,
        "mean": mean_value,
        "median": median_value,
        "sample_standard_deviation": deviation,
        "minimum": min(numeric),
        "maximum": max(numeric),
        "interval_95": interval,
    }


def inside(root, path):
    try:
        path.resolve().relative_to(root.resolve())
        return True
    except ValueError:
        return False


def control_document(manifest):
    return {
        "repository_commit": manifest.get("repository_commit"),
        "matiec_commit": manifest.get("matiec_commit"),
        "target_sha256": manifest.get("target_sha256"),
        "duration_seconds": manifest.get("duration_seconds"),
        "timeout_milliseconds": manifest.get("timeout_milliseconds"),
        "input_samples_dir": manifest.get("input_samples_dir"),
        "input_tool_version": manifest.get("input_tool_version"),
        "machine": manifest.get("machine"),
        "cycle_count": manifest.get("environment", {}).get("PLC_LAB_CYCLE_COUNT", "100"),
        "cycle_delay_nanoseconds": manifest.get("environment", {}).get("PLC_LAB_CYCLE_DELAY_NS", "0"),
    }


def discover(input_root):
    result_paths = sorted(input_root.rglob("evaluation-result.json"))
    require(result_paths, "no evaluation-result.json files were found")
    runs = []
    protocol_identity = None
    controls_by_benchmark = {}
    for result_path in result_paths:
        result = load_json(result_path)
        manifest_name = result.get("manifest")
        require(isinstance(manifest_name, str), "result manifest link is missing: " + str(result_path))
        manifest_path = result_path.parent / manifest_name
        require(inside(result_path.parent, manifest_path) and manifest_path.is_file(), "result manifest link is invalid: " + str(result_path))
        manifest = load_json(manifest_path)
        evaluation = manifest.get("evaluation", {})
        protocol_path = pathlib.Path(evaluation.get("protocol_path", ""))
        require(protocol_path.is_file(), "linked protocol is missing: " + str(result_path))
        protocol_checksum = sha256_file(protocol_path)
        require(protocol_checksum == evaluation.get("protocol_sha256"), "manifest protocol checksum differs: " + str(result_path))
        protocol = validate_protocol(load_json(protocol_path))
        validate_result(result, protocol, protocol_checksum)
        identity = (protocol["protocol_id"], protocol["protocol_version"], protocol_checksum)
        require(protocol_identity in (None, identity), "report input contains incompatible protocols")
        protocol_identity = identity
        for field in ("benchmark_id", "strategy_id", "replicate_index", "replicate_seed"):
            require(result.get(field) == evaluation.get(field), "result/manifest {} differs: {}".format(field, result_path))
        require(manifest.get("status") == result.get("run_status"), "result/manifest status differs: " + str(result_path))
        controls = control_document(manifest)
        control_text = json.dumps(controls, sort_keys=True, separators=(",", ":"))
        benchmark = result["benchmark_id"]
        require(benchmark not in controls_by_benchmark or controls_by_benchmark[benchmark] == control_text, "comparison controls differ for benchmark " + benchmark)
        controls_by_benchmark[benchmark] = control_text
        runs.append((result_path, manifest_path, result, manifest))
    return runs, protocol_identity


def build_report(input_root):
    runs, protocol_identity = discover(input_root)
    grouped = {}
    failed_runs = []
    missing_metrics = []
    observation_sources = {}
    run_records = []
    for result_path, manifest_path, result, manifest in runs:
        run_id = result_path.parent.relative_to(input_root).as_posix() or "."
        run_records.append(
            {
                "run_id": run_id,
                "manifest": str(manifest_path.resolve()),
                "result": str(result_path.resolve()),
                "benchmark_id": result["benchmark_id"],
                "strategy_id": result["strategy_id"],
                "replicate_index": result["replicate_index"],
                "replicate_seed": result["replicate_seed"],
                "status": result["run_status"],
            }
        )
        if result["run_status"] != "success":
            failed_runs.append(
                {
                    "run_id": run_id,
                    "manifest": str(manifest_path.resolve()),
                    "status": result["run_status"],
                    "exit_code": manifest.get("exit_code"),
                }
            )
        for metric_id in sorted(TRIAL_METRICS):
            measurement = result["metrics"][metric_id]
            if measurement["status"] == "complete":
                key = (result["benchmark_id"], result["strategy_id"], metric_id)
                grouped.setdefault(key, []).append(measurement["value"])
            else:
                missing_metrics.append(
                    {
                        "run_id": run_id,
                        "metric_id": metric_id,
                        "status": measurement["status"],
                        "reason": measurement["reason"],
                    }
                )
        for observation in result.get("observations", []):
            sample = result_path.parent / observation["replay_sample"]
            require(inside(result_path.parent, sample), "observation path escapes run: " + run_id)
            source = {
                "run_id": run_id,
                "replay_sample": str(sample.resolve()),
                "available": sample.is_file(),
            }
            observation_sources.setdefault(observation["stable_digest"], []).append(source)
            if not sample.is_file():
                missing_metrics.append(
                    {
                        "run_id": run_id,
                        "metric_id": "observation_replay_sample",
                        "status": "unavailable",
                        "reason": "replay sample does not exist: " + str(sample),
                    }
                )
    aggregates = []
    for key in sorted(grouped):
        aggregate = aggregate_values(grouped[key], key)
        aggregate.update({"benchmark_id": key[0], "strategy_id": key[1], "metric_id": key[2]})
        aggregates.append(aggregate)
    observations = [
        {"stable_digest": digest, "sources": sorted(sources, key=lambda item: (item["run_id"], item["replay_sample"]))}
        for digest, sources in sorted(observation_sources.items())
    ]
    return {
        "schema": REPORT_SCHEMA,
        "report_version": 1,
        "input_root": str(input_root.resolve()),
        "protocol": {
            "id": protocol_identity[0],
            "version": protocol_identity[1],
            "sha256": protocol_identity[2],
        },
        "run_count": len(runs),
        "runs": run_records,
        "aggregates": aggregates,
        "failed_runs": failed_runs,
        "missing_metrics": missing_metrics,
        "observations": observations,
        "artifacts": {
            "summary_csv": "summary.csv",
            "charts": ["charts/{}.svg".format(metric_id) for metric_id in sorted(TRIAL_METRICS)],
        },
    }


def csv_bytes(aggregates):
    output = io.StringIO(newline="")
    writer = csv.DictWriter(output, fieldnames=CSV_FIELDS, lineterminator="\n")
    writer.writeheader()
    for item in aggregates:
        writer.writerow(
            {
                "benchmark_id": item["benchmark_id"],
                "strategy_id": item["strategy_id"],
                "metric_id": item["metric_id"],
                "count": item["count"],
                "mean": item["mean"],
                "median": item["median"],
                "sample_standard_deviation": item["sample_standard_deviation"],
                "minimum": item["minimum"],
                "maximum": item["maximum"],
                "interval_95_low": item["interval_95"][0],
                "interval_95_high": item["interval_95"][1],
            }
        )
    return output.getvalue().encode("utf-8")


def svg_bytes(metric_id, aggregates):
    items = [item for item in aggregates if item["metric_id"] == metric_id]
    width = 900
    row_height = 30
    height = max(100, 60 + row_height * len(items))
    maximum = max((max(abs(item["minimum"]), abs(item["maximum"])) for item in items), default=1.0) or 1.0
    lines = [
        '<svg xmlns="http://www.w3.org/2000/svg" width="{}" height="{}" viewBox="0 0 {} {}">'.format(width, height, width, height),
        '<rect width="100%" height="100%" fill="white"/>',
        '<text x="20" y="28" font-family="sans-serif" font-size="18">{}</text>'.format(html.escape(metric_id)),
    ]
    for index, item in enumerate(items):
        y = 48 + index * row_height
        label = "{} / {}".format(item["benchmark_id"], item["strategy_id"])
        bar_width = 500.0 * max(0.0, item["mean"]) / maximum
        lines.append('<text x="20" y="{}" font-family="sans-serif" font-size="11">{}</text>'.format(y + 13, html.escape(label)))
        lines.append('<rect x="330" y="{}" width="{:.3f}" height="16" fill="#3b82f6"/>'.format(y, bar_width))
        lines.append('<text x="840" y="{}" text-anchor="end" font-family="monospace" font-size="11">{:.6g}</text>'.format(y + 13, item["mean"]))
    lines.append("</svg>")
    return ("\n".join(lines) + "\n").encode("utf-8")


def ensure_output(output_dir):
    if output_dir.exists() and any(output_dir.iterdir()):
        raise ValueError("output directory is not empty: " + str(output_dir))
    output_dir.mkdir(parents=True, exist_ok=True)


def generate(input_root, output_dir):
    require(input_root.is_dir(), "input root does not exist: " + str(input_root))
    ensure_output(output_dir)
    report = build_report(input_root)
    atomic_write(output_dir / "summary.csv", csv_bytes(report["aggregates"]))
    for metric_id in sorted(TRIAL_METRICS):
        atomic_write(output_dir / "charts" / (metric_id + ".svg"), svg_bytes(metric_id, report["aggregates"]))
    atomic_write(output_dir / "report.json", json_bytes(report))
    validate_report(output_dir)
    print("Generated report for {} runs: {}".format(report["run_count"], output_dir))


def validate_report(output_dir):
    report_path = output_dir / "report.json"
    require(report_path.is_file(), "report.json is missing")
    report = load_json(report_path)
    require(report.get("schema") == REPORT_SCHEMA and report.get("report_version") == 1, "unsupported report schema")
    require(report.get("run_count") == len(report.get("runs", [])), "report run count differs")
    for item in report.get("aggregates", []):
        expected = aggregate_values(item["values"], (item["benchmark_id"], item["strategy_id"], item["metric_id"]))
        for field in ("count", "mean", "median", "sample_standard_deviation", "minimum", "maximum", "interval_95"):
            require(item[field] == expected[field], "aggregate arithmetic differs: " + item["metric_id"])
    csv_path = output_dir / report["artifacts"]["summary_csv"]
    require(csv_path.is_file(), "summary CSV is missing")
    with csv_path.open("r", encoding="utf-8", newline="") as stream:
        rows = list(csv.DictReader(stream))
    require(len(rows) == len(report.get("aggregates", [])), "summary CSV row count differs")
    for row, aggregate in zip(rows, report.get("aggregates", [])):
        require(
            (row["benchmark_id"], row["strategy_id"], row["metric_id"]) ==
            (aggregate["benchmark_id"], aggregate["strategy_id"], aggregate["metric_id"]),
            "summary CSV group differs",
        )
        require(int(row["count"]) == aggregate["count"], "summary CSV count differs")
        numeric_fields = (
            ("mean", "mean"), ("median", "median"), ("minimum", "minimum"),
            ("maximum", "maximum"), ("interval_95_low", None), ("interval_95_high", None),
        )
        for csv_field, report_field in numeric_fields:
            if csv_field == "interval_95_low":
                expected_value = aggregate["interval_95"][0]
            elif csv_field == "interval_95_high":
                expected_value = aggregate["interval_95"][1]
            else:
                expected_value = aggregate[report_field]
            require(float(row[csv_field]) == expected_value, "summary CSV value differs: " + csv_field)
        deviation = aggregate["sample_standard_deviation"]
        require(
            (row["sample_standard_deviation"] == "" and deviation is None) or
            (deviation is not None and float(row["sample_standard_deviation"]) == deviation),
            "summary CSV deviation differs",
        )
    for chart in report["artifacts"]["charts"]:
        path = output_dir / chart
        require(path.is_file() and path.read_text(encoding="utf-8").startswith("<svg"), "chart is missing or invalid: " + chart)
    for observation in report.get("observations", []):
        require(len(observation["stable_digest"]) == 64, "observation digest is invalid")
        for source in observation["sources"]:
            if source["available"]:
                require(pathlib.Path(source["replay_sample"]).is_file(), "referenced replay sample is missing")
    print("PASS experiment report: {} runs".format(report["run_count"]))
    return report


def parse_args():
    parser = argparse.ArgumentParser(description="Generate or validate PLC Robustness Lab experiment reports.")
    subparsers = parser.add_subparsers(dest="command", required=True)
    generate_parser = subparsers.add_parser("generate")
    generate_parser.add_argument("--input-root", required=True, type=pathlib.Path)
    generate_parser.add_argument("--output-dir", required=True, type=pathlib.Path)
    validate_parser = subparsers.add_parser("validate")
    validate_parser.add_argument("report_dir", type=pathlib.Path)
    return parser.parse_args()


def main():
    args = parse_args()
    if args.command == "generate":
        generate(args.input_root.resolve(), args.output_dir.resolve())
    else:
        validate_report(args.report_dir.resolve())


if __name__ == "__main__":
    try:
        main()
    except (OSError, ValueError, json.JSONDecodeError) as error:
        print("Experiment report operation failed: {}".format(error), file=os.sys.stderr)
        raise SystemExit(2)
