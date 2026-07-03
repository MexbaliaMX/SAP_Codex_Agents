# xmllint Template Validation Report

Date: 2026-07-02

## Purpose

Provide `xmllint` on Windows and rerun upstream SAP skills template validation, including iFlow XML template checks.

## Tooling

Chocolatey system install was attempted first, but the shell did not have admin permission to write under `C:\ProgramData\chocolatey`.

Used a non-admin local install instead:

```text
C:\codex\SAP Agents\.tools\xmllint\dist\bin\xmllint.exe
```

The binaries were extracted from the pinned Chocolatey `xsltproc` package sources:

- `mingwrt-5.2.0-win32-x86_64.7z`
- `iconv-1.14-win32-x86_64.7z`
- `zlib-1.2.8-win32-x86_64.7z`
- `libxml2-2.9.3-win32-x86_64.7z`
- `libxslt-1.1.28-win32-x86_64.7z`

All archive SHA256 hashes were checked against the Chocolatey package install script before extraction.

`.tools/` is ignored by Git and is not part of the release archive.

## Validation

Command:

```powershell
$env:PATH = 'C:\codex\SAP Agents\.tools\xmllint\dist\bin;' + $env:PATH
cd "C:\codex\SAP Agents\.imports\sap-skills-main\sap-skills-main"
node scripts\validate-templates.mjs
```

Result:

```text
Template validation passed.
```

## Remaining Boundaries

- This validates upstream template structure only.
- It does not prove live SAP Integration Suite import, deployment, transport, or runtime behavior.
- The local `.tools` install should be recreated or replaced by an approved system package on another workstation.
