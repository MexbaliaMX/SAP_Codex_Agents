# UI5 Quality Review

Use for SAPUI5/OpenUI5 code review reports.

## Review Context

| Field | Value |
|---|---|
| App / namespace | [Name] |
| UI5 version | [Version] |
| Files reviewed | [Files] |
| Review mode | Read-only / Fix planning / Apply approved fixes |

## Findings

| Severity | Category | File / location | Finding | Evidence status | Impact | Owner | Recommendation | Verification |
|---|---|---|---|---|---|---|---|---|
| Critical / High / Medium / Low | Security | [File:line] | [Finding] | Confirmed / Assumed / Needs check | [Impact] | [Owner] | [Fix] | [Check] |

## Severity Guide

| Severity | Meaning |
|---|---|
| Critical | Security/stability issue that can block production |
| High | Major performance, deprecation, or support risk |
| Medium | Should fix for quality, accessibility, reliability, or maintainability |
| Low | Nice-to-have cleanup or documentation improvement |

## Review Categories

- Security: XSS, CSP, unsafe HTML, direct DOM, input validation.
- Performance: large list rendering, missing paging, excessive bindings, sync loading.
- Accessibility: icon-only buttons, labels, keyboard, screen reader behavior.
- Deprecation: `jQuery.sap.*`, sync require, deprecated controls/APIs.
- Architecture: MVC boundaries, model usage, routing, component structure.
- Reliability: missing error callbacks, busy state, message handling, logging.

## Verification Plan

| Check | Command / method | Expected result |
|---|---|---|
| UI5 linter | [Command] | No critical/high findings |
| Manual security smoke | [Method] | No unsafe rendering |
| Accessibility smoke | [Method] | Names and keyboard flow valid |
| Performance smoke | [Method] | No full-load or rendering bottleneck |