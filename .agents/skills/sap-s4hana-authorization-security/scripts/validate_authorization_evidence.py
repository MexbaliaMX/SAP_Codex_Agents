#!/usr/bin/env python3
"""Validate sanitized SAP authorization evidence matrices.

The validator is intentionally lightweight and uses only Python stdlib. It checks
CSV files or simple Markdown tables for required columns, blank owners, missing
approval gates, and unresolved evidence gaps.
"""

from __future__ import annotations

import argparse
import csv
import sys
from pathlib import Path


PROFILES = {
    "fiori-access": {
        "required": [
            "ProcessRole",
            "BusinessTask",
            "BusinessRole",
            "BusinessCatalog",
            "AppId",
            "AppName",
            "ODataService",
            "BackendRoleOrObject",
            "TestEvidence",
            "EvidenceStatus",
            "Owner",
            "ApprovalGate",
            "ValidationStatus",
        ],
        "owner": "Owner",
        "approval": "ApprovalGate",
        "evidence": "EvidenceStatus",
        "status": "ValidationStatus",
    },
    "sod-control": {
        "required": [
            "Process",
            "RoleOrPersona",
            "UserAlias",
            "SensitiveTask",
            "ConflictingTask",
            "Evidence",
            "Risk",
            "ControlStatus",
            "Owner",
            "ApprovalGate",
        ],
        "owner": "Owner",
        "approval": "ApprovalGate",
        "evidence": "Evidence",
        "status": "ControlStatus",
    },
    "authorization-readiness": {
        "required": [
            "Scope",
            "Environment",
            "Role",
            "Persona",
            "Evidence",
            "EvidenceStatus",
            "Owner",
            "ApprovalGate",
            "ValidationStatus",
        ],
        "owner": "Owner",
        "approval": "ApprovalGate",
        "evidence": "EvidenceStatus",
        "status": "ValidationStatus",
    },
    "trace-analysis": {
        "required": [
            "CaseId",
            "UserAlias",
            "Environment",
            "ObjectOrService",
            "Field",
            "Value",
            "Result",
            "BusinessJustification",
            "Owner",
            "ApprovalGate",
        ],
        "owner": "Owner",
        "approval": "ApprovalGate",
        "evidence": "Result",
        "status": "Result",
    },
}

BAD_VALUES = {"", "tbd", "todo", "pending", "unknown", "n/a", "na", "[owner]", "[gate]", "[evidence]"}
OPEN_VALUES = {"open", "pending", "missing", "unknown", "gap", "not provided", "not confirmed"}


def normalize(value: str | None) -> str:
    return (value or "").strip()


def normalize_key(value: str | None) -> str:
    return normalize(value).lower()


def read_csv(path: Path) -> tuple[list[str], list[dict[str, str]]]:
    with path.open(newline="", encoding="utf-8-sig") as handle:
        reader = csv.DictReader(handle)
        headers = [normalize(h) for h in (reader.fieldnames or [])]
        rows = [{normalize(k): normalize(v) for k, v in row.items()} for row in reader]
    return headers, rows


def split_markdown_row(line: str) -> list[str]:
    line = line.strip()
    if line.startswith("|"):
        line = line[1:]
    if line.endswith("|"):
        line = line[:-1]
    return [cell.strip().replace("<br>", " ") for cell in line.split("|")]


def read_markdown(path: Path) -> tuple[list[str], list[dict[str, str]]]:
    lines = path.read_text(encoding="utf-8-sig").splitlines()
    table_index = None
    for idx, line in enumerate(lines[:-1]):
        if "|" in line and set(lines[idx + 1].strip().replace("|", "").replace(" ", "")) <= {"-", ":"}:
            table_index = idx
            break
    if table_index is None:
        return [], []

    headers = split_markdown_row(lines[table_index])
    rows: list[dict[str, str]] = []
    for line in lines[table_index + 2 :]:
        if "|" not in line or not line.strip():
            break
        cells = split_markdown_row(line)
        rows.append({headers[i]: cells[i] if i < len(cells) else "" for i in range(len(headers))})
    return headers, rows


def read_matrix(path: Path) -> tuple[list[str], list[dict[str, str]]]:
    if path.suffix.lower() == ".csv":
        return read_csv(path)
    if path.suffix.lower() in {".md", ".markdown"}:
        return read_markdown(path)
    raise ValueError(f"unsupported file type: {path.suffix}")


def validate(path: Path, profile: str) -> list[str]:
    config = PROFILES[profile]
    headers, rows = read_matrix(path)
    issues: list[str] = []

    missing_columns = [col for col in config["required"] if col not in headers]
    if missing_columns:
        issues.append(f"{path}: missing required columns: {', '.join(missing_columns)}")

    if not rows:
        issues.append(f"{path}: no evidence rows found")
        return issues

    for index, row in enumerate(rows, start=1):
        owner = normalize_key(row.get(config["owner"]))
        approval = normalize_key(row.get(config["approval"]))
        evidence = normalize_key(row.get(config["evidence"]))
        status = normalize_key(row.get(config["status"]))

        if owner in BAD_VALUES:
            issues.append(f"{path}: row {index} has missing owner")
        if approval in BAD_VALUES:
            issues.append(f"{path}: row {index} has missing approval gate")
        if evidence in BAD_VALUES:
            issues.append(f"{path}: row {index} has missing evidence")
        if status in OPEN_VALUES or any(token in status for token in OPEN_VALUES):
            issues.append(f"{path}: row {index} has unresolved validation/control status: {row.get(config['status'], '')}")

    return issues


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile", required=True, choices=sorted(PROFILES))
    parser.add_argument("paths", nargs="+", type=Path)
    args = parser.parse_args(argv)

    all_issues: list[str] = []
    for path in args.paths:
        if not path.exists():
            all_issues.append(f"{path}: file does not exist")
            continue
        all_issues.extend(validate(path, args.profile))

    if all_issues:
        print("Authorization evidence validation failed:")
        for issue in all_issues:
            print(f"- {issue}")
        return 1

    print("Authorization evidence validation passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
