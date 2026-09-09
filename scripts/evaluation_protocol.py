#!/usr/bin/env python3
"""Validate and instantiate the versioned experiment evaluation protocol."""

import argparse
import hashlib
import json
import math
import os
import pathlib
import re
import tempfile


PROTOCOL_SCHEMA = "PLC_LAB_EVALUATION_PROTOCOL_V1"
RESULT_SCHEMA = "PLC_LAB_EVALUATION_RESULT_V1"
TRIAL_METRICS = {
    "valid_input_ratio",
    "path_coverage_delta",
    "plc_state_transition_count",
    "unique_observation_count",
    "time_to_first_observation_seconds",
    "replay_success_ratio",
}
AGGREGATE_METRICS = {"replicate_variability"}
COMPARISON_CONTROLS = {
    "benchmark_id",
    "program_sha256",
    "target_sha256",
    "input_samples_sha256",
    "grammar_sha256",
    "repository_commit",
    "matiec_commit",
    "input_tool_version",
    "duration_seconds",
    "timeout_milliseconds",
    "cycle_count",
    "cycle_delay_nanoseconds",
    "machine_fingerprint",
}
VARYING_DIMENSIONS = {"strategy_id", "replicate_index", "replicate_seed"}
IDENTIFIER = re.compile(r"^[a-z0-9][a-z0-9._-]*$")


def load_json(path):
    return json.loads(path.read_text(encoding="utf-8"))


def sha256_file(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def atomic_write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    handle, temporary_name = tempfile.mkstemp(prefix=path.name + ".", dir=str(path.parent))
    try:
        with os.fdopen(handle, "w", encoding="utf-8") as stream:
            json.dump(value, stream, indent=2, sort_keys=True)
            stream.write("\n")
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary_name, str(path))
    except Exception:
        try:
            os.unlink(temporary_name)
        except OSError:
            pass
        raise


def require(condition, message):
    if not condition:
        raise ValueError(message)


def validate_protocol(document):
    require(document.get("schema") == PROTOCOL_SCHEMA, "unsupported evaluation protocol schema")
    require(isinstance(document.get("protocol_id"), str) and IDENTIFIER.fullmatch(document["protocol_id"]), "invalid protocol_id")
    require(document.get("protocol_version") == 1, "protocol_version must be 1")
    require(set(document.get("comparison_controls", [])) == COMPARISON_CONTROLS, "comparison controls do not match the required set")
    require(set(document.get("varying_dimensions", [])) == VARYING_DIMENSIONS, "varying dimensions do not match the required set")

    repeated = document.get("repeated_trials", {})
    seeds = repeated.get("seeds")
    minimum = repeated.get("minimum_replicates")
    require(isinstance(minimum, int) and not isinstance(minimum, bool) and minimum >= 5, "minimum_replicates must be at least 5")
    require(isinstance(seeds, list) and len(seeds) >= minimum, "the protocol must provide enough fixed seeds")
    require(all(isinstance(seed, int) and not isinstance(seed, bool) and seed >= 0 for seed in seeds), "fixed seeds must be unsigned integers")
    require(len(set(seeds)) == len(seeds), "fixed seeds must be unique")
    require(repeated.get("seed_option") == "-s", "seed_option must be -s")

    metrics = document.get("metrics")
    require(isinstance(metrics, list), "metrics must be a list")
    metric_ids = [metric.get("id") for metric in metrics if isinstance(metric, dict)]
    require(len(metrics) == 7 and len(metric_ids) == 7 and len(set(metric_ids)) == 7, "the protocol must declare seven unique metrics")
    require(set(metric_ids) == TRIAL_METRICS | AGGREGATE_METRICS, "metric identifiers do not match the required set")
    for metric in metrics:
        metric_id = metric["id"]
        expected_scope = "trial" if metric_id in TRIAL_METRICS else "aggregate"
        require(metric.get("scope") == expected_scope, "invalid scope for metric " + metric_id)
        for field in ("unit", "direction", "formula", "definition", "missing_value", "value_type"):
            require(isinstance(metric.get(field), str) and metric[field], "missing {} for metric {}".format(field, metric_id))
        require(metric.get("missing_value") == "null-with-reason", "metric {} must use null-with-reason".format(metric_id))
        bounds = metric.get("bounds")
        if bounds is not None:
            require(isinstance(bounds, list) and len(bounds) == 2, "invalid bounds for metric " + metric_id)
            require(bounds[0] is None or isinstance(bounds[0], (int, float)), "invalid lower bound for metric " + metric_id)
            require(bounds[1] is None or isinstance(bounds[1], (int, float)), "invalid upper bound for metric " + metric_id)

    aggregation = document.get("aggregation", {})
    require(set(aggregation.get("center", [])) == {"mean", "median"}, "aggregation must report mean and median")
    require(aggregation.get("interval") == "bootstrap-percentile-95", "aggregation interval must be bootstrap-percentile-95")
    require(aggregation.get("pair_by") == "replicate_seed", "comparisons must be paired by replicate_seed")
    require("sample-standard-deviation" in aggregation.get("variability", []), "aggregation must report sample standard deviation")
    return document


def protocol_metric_map(protocol):
    return {metric["id"]: metric for metric in protocol["metrics"]}


def evaluation_context(protocol_path, benchmark_id, strategy_id, replicate_index, replicate_seed):
    protocol_path = protocol_path.resolve()
    protocol = validate_protocol(load_json(protocol_path))
    require(IDENTIFIER.fullmatch(benchmark_id or ""), "invalid benchmark_id")
    require(IDENTIFIER.fullmatch(strategy_id or ""), "invalid strategy_id")
    require(isinstance(replicate_index, int) and not isinstance(replicate_index, bool), "replicate_index must be an integer")
    seeds = protocol["repeated_trials"]["seeds"]
    require(0 <= replicate_index < len(seeds), "replicate_index is outside the fixed-seed list")
    require(replicate_seed == seeds[replicate_index], "replicate_seed does not match the fixed seed at replicate_index")
    return protocol, {
        "protocol_id": protocol["protocol_id"],
        "protocol_version": protocol["protocol_version"],
        "protocol_path": str(protocol_path),
        "protocol_sha256": sha256_file(protocol_path),
        "benchmark_id": benchmark_id,
        "strategy_id": strategy_id,
        "replicate_index": replicate_index,
        "replicate_seed": replicate_seed,
    }


def create_result_template(protocol, context, manifest_name="manifest.json"):
    metric_map = protocol_metric_map(protocol)
    metrics = {}
    for metric_id in sorted(TRIAL_METRICS):
        metrics[metric_id] = {
            "status": "pending",
            "value": None,
            "unit": metric_map[metric_id]["unit"],
            "reason": "measurement has not been collected",
            "evidence": [],
        }
    return {
        "schema": RESULT_SCHEMA,
        "protocol_id": context["protocol_id"],
        "protocol_version": context["protocol_version"],
        "protocol_sha256": context["protocol_sha256"],
        "manifest": manifest_name,
        "benchmark_id": context["benchmark_id"],
        "strategy_id": context["strategy_id"],
        "replicate_index": context["replicate_index"],
        "replicate_seed": context["replicate_seed"],
        "run_status": "running",
        "metrics": metrics,
    }


def validate_result(result, protocol, protocol_sha256=None):
    require(result.get("schema") == RESULT_SCHEMA, "unsupported evaluation result schema")
    require(result.get("protocol_id") == protocol["protocol_id"], "result protocol_id does not match")
    require(result.get("protocol_version") == protocol["protocol_version"], "result protocol_version does not match")
    if protocol_sha256 is not None:
        require(result.get("protocol_sha256") == protocol_sha256, "result protocol checksum does not match")
    require(IDENTIFIER.fullmatch(result.get("benchmark_id", "")), "invalid result benchmark_id")
    require(IDENTIFIER.fullmatch(result.get("strategy_id", "")), "invalid result strategy_id")
    index = result.get("replicate_index")
    seed = result.get("replicate_seed")
    require(isinstance(index, int) and not isinstance(index, bool), "invalid result replicate_index")
    seeds = protocol["repeated_trials"]["seeds"]
    require(0 <= index < len(seeds) and seed == seeds[index], "result seed/index pair does not match the protocol")
    require(result.get("run_status") in {"running", "success", "nonzero", "interrupted"}, "invalid run_status")
    metrics = result.get("metrics")
    require(isinstance(metrics, dict) and set(metrics) == TRIAL_METRICS, "result must contain exactly the six trial metrics")
    definitions = protocol_metric_map(protocol)
    for metric_id, measurement in metrics.items():
        require(isinstance(measurement, dict), "invalid measurement for " + metric_id)
        require(measurement.get("unit") == definitions[metric_id]["unit"], "unit mismatch for " + metric_id)
        status = measurement.get("status")
        value = measurement.get("value")
        evidence = measurement.get("evidence")
        reason = measurement.get("reason")
        require(status in {"pending", "unavailable", "complete"}, "invalid status for " + metric_id)
        require(isinstance(evidence, list) and all(isinstance(item, str) and item for item in evidence), "invalid evidence for " + metric_id)
        if status != "complete":
            require(value is None, "non-complete measurement must use null for " + metric_id)
            require(isinstance(reason, str) and reason, "non-complete measurement needs a reason for " + metric_id)
            continue
        require(isinstance(value, (int, float)) and not isinstance(value, bool) and math.isfinite(value), "complete measurement needs a finite numeric value for " + metric_id)
        if definitions[metric_id]["value_type"] == "integer":
            require(isinstance(value, int), "measurement must be an integer for " + metric_id)
        require(evidence, "complete measurement needs evidence for " + metric_id)
        bounds = definitions[metric_id].get("bounds")
        if bounds:
            require(bounds[0] is None or value >= bounds[0], "measurement is below its lower bound for " + metric_id)
            require(bounds[1] is None or value <= bounds[1], "measurement is above its upper bound for " + metric_id)
    observations = result.get("observations", [])
    require(isinstance(observations, list), "observations must be a list")
    for observation in observations:
        require(isinstance(observation, dict) and set(observation) == {"stable_digest", "replay_sample"}, "invalid observation reference")
        require(re.fullmatch(r"[0-9a-f]{64}", observation["stable_digest"] or ""), "observation stable_digest must be SHA-256")
        replay_sample = pathlib.PurePosixPath(observation["replay_sample"])
        require(not replay_sample.is_absolute() and ".." not in replay_sample.parts and replay_sample.parts, "observation replay path escapes its experiment directory")
    return result


def default_protocol_path():
    return pathlib.Path(__file__).resolve().parents[1] / "evaluation" / "protocol-v1.json"


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Manage the PLC Robustness Lab evaluation protocol.")
    subparsers = parser.add_subparsers(dest="command", required=True)
    validate = subparsers.add_parser("validate-protocol")
    validate.add_argument("protocol", nargs="?", type=pathlib.Path, default=default_protocol_path())
    result = subparsers.add_parser("validate-result")
    result.add_argument("result", type=pathlib.Path)
    result.add_argument("--protocol", type=pathlib.Path, default=default_protocol_path())
    template = subparsers.add_parser("template")
    template.add_argument("--protocol", type=pathlib.Path, default=default_protocol_path())
    template.add_argument("--benchmark-id", required=True)
    template.add_argument("--strategy-id", required=True)
    template.add_argument("--replicate-index", required=True, type=int)
    template.add_argument("--replicate-seed", required=True, type=int)
    template.add_argument("--manifest-name", default="manifest.json")
    template.add_argument("--output", type=pathlib.Path)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    if args.command == "validate-protocol":
        validate_protocol(load_json(args.protocol))
        print("PASS evaluation protocol {}".format(args.protocol))
    elif args.command == "validate-result":
        protocol = validate_protocol(load_json(args.protocol))
        validate_result(load_json(args.result), protocol, sha256_file(args.protocol))
        print("PASS evaluation result {}".format(args.result))
    else:
        protocol, context = evaluation_context(
            args.protocol, args.benchmark_id, args.strategy_id,
            args.replicate_index, args.replicate_seed,
        )
        result = create_result_template(protocol, context, args.manifest_name)
        validate_result(result, protocol, context["protocol_sha256"])
        if args.output:
            atomic_write_json(args.output, result)
        else:
            print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, ValueError, json.JSONDecodeError) as error:
        print("Evaluation protocol operation failed: {}".format(error), file=os.sys.stderr)
        raise SystemExit(2)
