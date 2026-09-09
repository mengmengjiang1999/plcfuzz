#!/usr/bin/env python3
"""Create, validate, and execute controlled input-generation comparison plans."""

import argparse
import hashlib
import json
import os
import pathlib
import subprocess
import tempfile

from evaluation_protocol import load_json, sha256_file, validate_protocol


PLAN_SCHEMA = "PLC_LAB_COMPARISON_PLAN_V1"
REGISTRY_SCHEMA = "PLC_LAB_INPUT_STRATEGY_REGISTRY_V1"
MAINTAINED_STRATEGIES = ("random-bytes", "protocol-valid", "structure-aware")
OPTIONAL_STRATEGY = "state-feedback"


def require(condition, message):
    if not condition:
        raise ValueError(message)


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


def tree_sha256(path):
    require(path.is_dir(), "directory does not exist: " + str(path))
    digest = hashlib.sha256()
    files = sorted(item for item in path.rglob("*") if item.is_file())
    require(files, "directory contains no files: " + str(path))
    for item in files:
        relative = item.relative_to(path).as_posix().encode("utf-8")
        digest.update(len(relative).to_bytes(8, "big"))
        digest.update(relative)
        content = item.read_bytes()
        digest.update(len(content).to_bytes(8, "big"))
        digest.update(content)
    return digest.hexdigest()


def validate_registry(registry):
    require(registry.get("schema") == REGISTRY_SCHEMA, "unsupported strategy registry schema")
    require(registry.get("registry_version") == 1, "strategy registry version must be 1")
    strategies = registry.get("strategies")
    require(isinstance(strategies, list) and len(strategies) == 4, "strategy registry must contain four strategies")
    by_id = {strategy.get("id"): strategy for strategy in strategies if isinstance(strategy, dict)}
    require(set(by_id) == set(MAINTAINED_STRATEGIES) | {OPTIONAL_STRATEGY}, "strategy IDs do not match the required set")
    expected = {
        "random-bytes": (False, False, False, "maintained"),
        "protocol-valid": (True, False, False, "maintained"),
        "structure-aware": (True, True, False, "maintained"),
        "state-feedback": (True, True, True, "adapter-required"),
    }
    for strategy_id, values in expected.items():
        strategy = by_id[strategy_id]
        observed = (
            strategy.get("uses_grammar"), strategy.get("uses_adapter"),
            strategy.get("adapter_only"), strategy.get("availability"),
        )
        require(observed == values, "effective configuration differs for " + strategy_id)
        require(isinstance(strategy.get("summary"), str) and strategy["summary"], "strategy summary is missing")
    return by_id


def repo_path(repo_root, value, kind):
    path = pathlib.Path(value).resolve()
    require(path.exists(), "{} does not exist: {}".format(kind, path))
    return path


def generate_plan(args):
    repo_root = args.repo_root.resolve()
    protocol_path = repo_path(repo_root, args.protocol, "protocol")
    registry_path = repo_path(repo_root, args.registry, "strategy registry")
    benchmark_path = repo_path(repo_root, args.benchmarks, "benchmark catalog")
    input_samples = repo_path(repo_root, args.input_samples_dir, "input samples directory")
    grammar = repo_path(repo_root, args.grammar, "grammar")
    protocol = validate_protocol(load_json(protocol_path))
    strategies = validate_registry(load_json(registry_path))
    benchmark_catalog = load_json(benchmark_path)
    require(benchmark_catalog.get("schema") == "PLC_LAB_BENCHMARK_CATALOG_V1", "unsupported benchmark catalog")
    require(args.duration > 0 and args.timeout > 0, "duration and timeout must be positive")

    all_cases = {case["id"]: case for case in benchmark_catalog["cases"]}
    selected_ids = sorted(all_cases) if not args.benchmark_id else sorted(set(args.benchmark_id))
    require(selected_ids and all(identifier in all_cases for identifier in selected_ids), "unknown or empty benchmark selection")
    selected_strategies = list(MAINTAINED_STRATEGIES)
    optional_adapter = None
    if args.state_feedback_adapter is not None:
        optional_adapter = repo_path(repo_root, args.state_feedback_adapter, "state-feedback adapter")
        require(optional_adapter.is_file(), "state-feedback adapter must be a file")
        selected_strategies.append(OPTIONAL_STRATEGY)

    source_adapter = repo_root / "input_generation" / "plc_input_transformer.cpp"
    plan_strategies = []
    for strategy_id in selected_strategies:
        strategy = strategies[strategy_id]
        item = {
            "id": strategy_id,
            "uses_grammar": strategy["uses_grammar"],
            "uses_adapter": strategy["uses_adapter"],
            "adapter_only": strategy["adapter_only"],
            "availability": "configured" if strategy_id == OPTIONAL_STRATEGY else "maintained",
        }
        if strategy_id == "structure-aware":
            item["adapter_source"] = str(source_adapter.resolve())
            item["adapter_source_sha256"] = sha256_file(source_adapter)
        elif strategy_id == OPTIONAL_STRATEGY:
            item["adapter_path"] = str(optional_adapter)
            item["adapter_sha256"] = sha256_file(optional_adapter)
        plan_strategies.append(item)

    plan_benchmarks = [
        {
            "id": identifier,
            "source": str((repo_root / all_cases[identifier]["source"]).resolve()),
            "source_sha256": all_cases[identifier]["source_sha256"],
        }
        for identifier in selected_ids
    ]
    seeds = protocol["repeated_trials"]["seeds"]
    trials = []
    for benchmark in plan_benchmarks:
        for strategy in plan_strategies:
            for replicate_index, replicate_seed in enumerate(seeds):
                trials.append(
                    {
                        "id": "{}--{}--r{}".format(benchmark["id"], strategy["id"], replicate_index),
                        "benchmark_id": benchmark["id"],
                        "strategy_id": strategy["id"],
                        "replicate_index": replicate_index,
                        "replicate_seed": replicate_seed,
                    }
                )
    plan = {
        "schema": PLAN_SCHEMA,
        "plan_version": 1,
        "protocol": {"path": str(protocol_path), "sha256": sha256_file(protocol_path)},
        "strategy_registry": {"path": str(registry_path), "sha256": sha256_file(registry_path)},
        "benchmark_catalog": {"path": str(benchmark_path), "sha256": sha256_file(benchmark_path)},
        "budget": {"duration_seconds": args.duration, "timeout_milliseconds": args.timeout},
        "resources": {
            "input_samples_dir": str(input_samples),
            "input_samples_sha256": tree_sha256(input_samples),
            "grammar": str(grammar),
            "grammar_sha256": sha256_file(grammar),
        },
        "benchmarks": plan_benchmarks,
        "strategies": plan_strategies,
        "trials": trials,
    }
    validate_plan_document(plan)
    atomic_write_json(args.output.resolve(), plan)
    print("Generated comparison plan with {} trials: {}".format(len(trials), args.output.resolve()))


def validate_checksum(reference, label):
    path = pathlib.Path(reference["path"])
    require(path.is_file(), "{} is missing: {}".format(label, path))
    require(sha256_file(path) == reference["sha256"], label + " checksum differs")
    return path


def validate_plan_document(plan):
    require(plan.get("schema") == PLAN_SCHEMA and plan.get("plan_version") == 1, "unsupported comparison plan")
    protocol_path = validate_checksum(plan["protocol"], "protocol")
    registry_path = validate_checksum(plan["strategy_registry"], "strategy registry")
    benchmark_path = validate_checksum(plan["benchmark_catalog"], "benchmark catalog")
    protocol = validate_protocol(load_json(protocol_path))
    registry = validate_registry(load_json(registry_path))
    benchmark_catalog = load_json(benchmark_path)
    catalog_cases = {case["id"]: case for case in benchmark_catalog["cases"]}
    budget = plan.get("budget", {})
    require(isinstance(budget.get("duration_seconds"), int) and budget["duration_seconds"] > 0, "plan duration must be positive")
    require(isinstance(budget.get("timeout_milliseconds"), int) and budget["timeout_milliseconds"] > 0, "plan timeout must be positive")
    resources = plan.get("resources", {})
    input_samples = pathlib.Path(resources.get("input_samples_dir", ""))
    require(tree_sha256(input_samples) == resources.get("input_samples_sha256"), "input samples checksum differs")
    grammar = pathlib.Path(resources.get("grammar", ""))
    require(grammar.is_file() and sha256_file(grammar) == resources.get("grammar_sha256"), "grammar checksum differs")

    benchmarks = plan.get("benchmarks")
    require(isinstance(benchmarks, list) and benchmarks, "plan has no benchmarks")
    benchmark_ids = set()
    for benchmark in benchmarks:
        identifier = benchmark.get("id")
        require(identifier in catalog_cases and identifier not in benchmark_ids, "invalid or duplicate plan benchmark")
        benchmark_ids.add(identifier)
        source = pathlib.Path(benchmark["source"])
        require(source.is_file() and sha256_file(source) == benchmark["source_sha256"] == catalog_cases[identifier]["source_sha256"], "benchmark source checksum differs: " + identifier)

    strategies = plan.get("strategies")
    require(isinstance(strategies, list) and strategies, "plan has no strategies")
    strategy_ids = set()
    for strategy in strategies:
        identifier = strategy.get("id")
        require(identifier in registry and identifier not in strategy_ids, "invalid or duplicate plan strategy")
        strategy_ids.add(identifier)
        expected = registry[identifier]
        for field in ("uses_grammar", "uses_adapter", "adapter_only"):
            require(strategy.get(field) == expected[field], "strategy configuration differs: " + identifier)
        if identifier == "structure-aware":
            source = pathlib.Path(strategy.get("adapter_source", ""))
            require(source.is_file() and sha256_file(source) == strategy.get("adapter_source_sha256"), "structure-aware adapter source checksum differs")
        if identifier == OPTIONAL_STRATEGY:
            adapter = pathlib.Path(strategy.get("adapter_path", ""))
            require(adapter.is_file() and sha256_file(adapter) == strategy.get("adapter_sha256"), "state-feedback adapter checksum differs")
    require(set(MAINTAINED_STRATEGIES).issubset(strategy_ids), "plan omits a maintained strategy")

    seeds = protocol["repeated_trials"]["seeds"]
    expected_trials = {
        (benchmark_id, strategy_id, index, seed)
        for benchmark_id in benchmark_ids
        for strategy_id in strategy_ids
        for index, seed in enumerate(seeds)
    }
    trials = plan.get("trials")
    require(isinstance(trials, list), "plan trials must be a list")
    observed = set()
    trial_ids = set()
    for trial in trials:
        key = (trial.get("benchmark_id"), trial.get("strategy_id"), trial.get("replicate_index"), trial.get("replicate_seed"))
        require(key in expected_trials and key not in observed, "invalid or duplicate comparison trial")
        observed.add(key)
        expected_id = "{}--{}--r{}".format(key[0], key[1], key[2])
        require(trial.get("id") == expected_id and expected_id not in trial_ids, "invalid or duplicate trial ID")
        trial_ids.add(expected_id)
    require(observed == expected_trials, "comparison plan does not contain complete paired-seed coverage")
    return plan


def validate_plan(path):
    plan = validate_plan_document(load_json(path))
    print("PASS comparison plan: {} trials".format(len(plan["trials"])))
    return plan


def run_trial(args):
    plan = validate_plan(args.plan.resolve())
    matches = [trial for trial in plan["trials"] if trial["id"] == args.trial_id]
    require(len(matches) == 1, "trial ID is not present in the plan: " + args.trial_id)
    trial = matches[0]
    benchmark = next(item for item in plan["benchmarks"] if item["id"] == trial["benchmark_id"])
    strategy = next(item for item in plan["strategies"] if item["id"] == trial["strategy_id"])
    repo_root = pathlib.Path(__file__).resolve().parents[1]
    if args.print_only:
        print(json.dumps({"trial": trial, "benchmark": benchmark, "strategy": strategy}, indent=2, sort_keys=True))
        return
    subprocess.run([str(repo_root / "scripts/plc-lab"), "build", "plc", benchmark["source"]], check=True)
    subprocess.run([str(repo_root / "scripts/plc-lab"), "build", "analyze"], check=True)
    if strategy["id"] == "structure-aware":
        subprocess.run([str(repo_root / "scripts/plc-lab"), "build", "transformer"], check=True)
    subprocess.run([str(repo_root / "scripts/plc-lab"), "build", "instrumented"], check=True)
    environment = dict(os.environ)
    environment.update(
        {
            "INPUT_SAMPLES_DIR": plan["resources"]["input_samples_dir"],
            "INPUT_GRAMMAR": plan["resources"]["grammar"],
            "EXPERIMENT_DURATION": str(plan["budget"]["duration_seconds"]),
            "EXECUTION_TIMEOUT": str(plan["budget"]["timeout_milliseconds"]),
            "PLC_LAB_INPUT_STRATEGY": trial["strategy_id"],
            "EVALUATION_PROTOCOL": plan["protocol"]["path"],
            "EVALUATION_BENCHMARK_ID": trial["benchmark_id"],
            "EVALUATION_STRATEGY_ID": trial["strategy_id"],
            "EVALUATION_REPLICATE_INDEX": str(trial["replicate_index"]),
            "EVALUATION_REPLICATE_SEED": str(trial["replicate_seed"]),
        }
    )
    if args.experiment_dir:
        environment["EXPERIMENT_DIR"] = str(args.experiment_dir.resolve())
    if strategy["id"] == OPTIONAL_STRATEGY:
        environment["PLC_LAB_STATE_FEEDBACK_ADAPTER"] = strategy["adapter_path"]
    subprocess.run([str(repo_root / "scripts/plc-lab"), "experiment"], check=True, env=environment)


def parse_args():
    repo_root = pathlib.Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description="Manage controlled input-generation comparison plans.")
    subparsers = parser.add_subparsers(dest="command", required=True)
    generate = subparsers.add_parser("generate")
    generate.add_argument("--repo-root", type=pathlib.Path, default=repo_root)
    generate.add_argument("--protocol", type=pathlib.Path, default=repo_root / "evaluation/protocol-v1.json")
    generate.add_argument("--registry", type=pathlib.Path, default=repo_root / "evaluation/strategies-v1.json")
    generate.add_argument("--benchmarks", type=pathlib.Path, default=repo_root / "benchmarks/manifest-v1.json")
    generate.add_argument("--input-samples-dir", type=pathlib.Path, default=repo_root / "benchmarks/replay")
    generate.add_argument("--grammar", type=pathlib.Path, default=repo_root / "input_generation/plc.grammar")
    generate.add_argument("--duration", type=int, default=3600)
    generate.add_argument("--timeout", type=int, default=10000)
    generate.add_argument("--benchmark-id", action="append")
    generate.add_argument("--state-feedback-adapter", type=pathlib.Path)
    generate.add_argument("--output", required=True, type=pathlib.Path)
    validate = subparsers.add_parser("validate")
    validate.add_argument("plan", type=pathlib.Path)
    run = subparsers.add_parser("run")
    run.add_argument("plan", type=pathlib.Path)
    run.add_argument("--trial-id", required=True)
    run.add_argument("--experiment-dir", type=pathlib.Path)
    run.add_argument("--print-only", action="store_true")
    return parser.parse_args()


def main():
    args = parse_args()
    if args.command == "generate":
        generate_plan(args)
    elif args.command == "validate":
        validate_plan(args.plan.resolve())
    else:
        run_trial(args)


if __name__ == "__main__":
    try:
        main()
    except (OSError, ValueError, json.JSONDecodeError, subprocess.CalledProcessError) as error:
        print("Comparison plan operation failed: {}".format(error), file=os.sys.stderr)
        raise SystemExit(2)
