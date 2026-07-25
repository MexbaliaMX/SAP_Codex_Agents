#!/usr/bin/env python3
"""Generate repeatable SAP authorization review packs from sanitized evidence."""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

from validate_authorization_evidence import read_matrix, validate


PROFILE_TITLES = {
    "fiori-access": "SAP Authorization Review Pack - Fiori Access",
    "sod-control": "SAP Authorization Review Pack - SoD Control",
    "authorization-readiness": "SAP Authorization Review Pack - Readiness",
    "trace-analysis": "SAP Authorization Review Pack - Trace Analysis",
}


PROFILE_FIELDS = {
    "fiori-access": {
        "fact_columns": ["ProcessRole", "BusinessTask", "AppId", "AppName", "EvidenceStatus", "ValidationStatus", "Owner"],
        "risk_columns": ["ProcessRole", "Risk", "ValidationStatus", "Notes"],
        "gate_columns": ["ProcessRole", "Owner", "ApprovalGate", "ValidationStatus"],
        "actions": [
            "Confirm role -> catalog -> space/page -> app -> service -> backend traceability with sanitized evidence.",
            "Run positive and negative user tests before transport or exception approval.",
            "Close open OData, CDS/DCL, backend role, and SAP GUI fallback gaps with the responsible owner.",
        ],
    },
    "sod-control": {
        "fact_columns": ["Process", "RoleOrPersona", "UserAlias", "SensitiveTask", "ConflictingTask", "Risk", "ControlStatus", "Owner"],
        "risk_columns": ["Process", "RoleOrPersona", "Risk", "ControlStatus", "Notes"],
        "gate_columns": ["Process", "Owner", "ApprovalGate", "ControlStatus"],
        "actions": [
            "Confirm the conflict with sanitized role, user, app/transaction, and authorization evidence.",
            "Define or reject compensating controls with owner, monitoring frequency, evidence, and expiry.",
            "Hold transports or exceptions until security, process owner, and control owner gates are complete.",
        ],
    },
    "authorization-readiness": {
        "fact_columns": ["Scope", "Environment", "Role", "Persona", "EvidenceStatus", "ValidationStatus", "Owner"],
        "risk_columns": ["Scope", "Role", "ValidationStatus", "Evidence"],
        "gate_columns": ["Scope", "Owner", "ApprovalGate", "ValidationStatus"],
        "actions": [
            "Close missing ownership, evidence, approval, and negative-test gaps before go-live decisions.",
            "Confirm role generation, assignment policy, transport dependencies, and retest evidence.",
            "Keep exceptions time-bound and approved by process, security, and control owners.",
        ],
    },
    "trace-analysis": {
        "fact_columns": ["CaseId", "UserAlias", "Environment", "ObjectOrService", "Field", "Value", "Result", "Owner"],
        "risk_columns": ["CaseId", "ObjectOrService", "Result", "BusinessJustification"],
        "gate_columns": ["CaseId", "Owner", "ApprovalGate", "Result"],
        "actions": [
            "Link every missing authorization to a business task and owner-approved role scope.",
            "Avoid blindly adding trace output; retest with positive and negative cases.",
            "Document the approval gate before role changes or transports.",
        ],
    },
}


def cell(row: dict[str, str], column: str) -> str:
    return (row.get(column) or "").strip() or "TBD"


def markdown_table(headers: list[str], rows: list[list[str]]) -> list[str]:
    output = ["| " + " | ".join(headers) + " |", "| " + " | ".join("---" for _ in headers) + " |"]
    output.extend("| " + " | ".join(value.replace("\n", " ") for value in row) + " |" for row in rows)
    return output


def issue_rows(issues: list[str]) -> list[list[str]]:
    if not issues:
        return [["None", "No validator issues found"]]
    rows: list[list[str]] = []
    for issue in issues:
        if ": " in issue:
            source, detail = issue.split(": ", 1)
        else:
            source, detail = "Evidence", issue
        rows.append([source.replace("\\", "/"), detail])
    return rows


def risk_level(row: dict[str, str], profile: str) -> str:
    if "Risk" in row:
        return cell(row, "Risk")
    status = (cell(row, "ValidationStatus") if profile != "sod-control" else cell(row, "ControlStatus")).lower()
    if any(token in status for token in ("missing", "open", "gap", "pending")):
        return "High"
    return "Medium"


def build_pack(path: Path, profile: str) -> str:
    headers, rows = read_matrix(path)
    issues = validate(path, profile)
    fields = PROFILE_FIELDS[profile]
    title = PROFILE_TITLES[profile]

    lines: list[str] = [
        f"# {title}",
        "",
        "Generated from sanitized evidence. This pack is advisory only; it is not tenant proof, audit approval, fiscal/legal advice, or production authorization.",
        "",
        "## Scope",
        "",
    ]

    lines.extend(
        markdown_table(
            ["Field", "Value"],
            [
                ["Source file", path.as_posix()],
                ["Profile", profile],
                ["Evidence rows", str(len(rows))],
                ["Required columns present", "Yes" if not any("missing required columns" in issue for issue in issues) else "No"],
                ["Validator status", "Passed" if not issues else "Findings found"],
            ],
        )
    )

    lines.extend(["", "## Hechos Confirmados", ""])
    fact_headers = fields["fact_columns"]
    lines.extend(markdown_table(fact_headers, [[cell(row, column) for column in fact_headers] for row in rows]))

    lines.extend(["", "## Brechas De Validacion", ""])
    lines.extend(markdown_table(["Source", "Finding"], issue_rows(issues)))

    lines.extend(["", "## Riesgos", ""])
    risk_headers = fields["risk_columns"]
    risk_rows = []
    for row in rows:
        values = [cell(row, column) for column in risk_headers]
        values.insert(1, risk_level(row, profile))
        risk_rows.append(values)
    lines.extend(markdown_table([risk_headers[0], "RiskLevel", *risk_headers[1:]], risk_rows))

    if profile == "sod-control":
        lines.extend(
            [
                "",
                "## Mexico Fiscal And Audit Cues",
                "",
                "- For Record-to-Report or payment-related access, validate CFDI, complemento de pago, payment approval logs, and retained evidence.",
                "- For Procure-to-Pay receiving or logistics access, validate whether Carta Porte or logistics evidence is relevant.",
                "- Keep exception expiry, monitoring frequency, control owner, and audit trail evidence explicit.",
            ]
        )

    lines.extend(["", "## Approval Gates", ""])
    gate_headers = fields["gate_columns"]
    lines.extend(markdown_table(gate_headers, [[cell(row, column) for column in gate_headers] for row in rows]))

    lines.extend(["", "## Proximas Acciones", ""])
    action_rows = [[str(index), action, "Process/security/control owner", "Retest evidence or approval record"] for index, action in enumerate(fields["actions"], start=1)]
    lines.extend(markdown_table(["Priority", "Action", "Owner", "Validation"], action_rows))

    lines.append("")
    return "\n".join(lines)


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile", required=True, choices=sorted(PROFILE_TITLES))
    parser.add_argument("--output", type=Path)
    parser.add_argument("path", type=Path)
    args = parser.parse_args(argv)

    if not args.path.exists():
        print(f"{args.path}: file does not exist", file=sys.stderr)
        return 2

    pack = build_pack(args.path, args.profile)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(pack, encoding="utf-8")
    else:
        print(pack)
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
