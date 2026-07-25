param(
  [string]$Root = (Get-Location).Path,
  [string]$Python = "python"
)

$ErrorActionPreference = "Stop"
$Failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure {
  param([string]$Message)
  $script:Failures.Add($Message) | Out-Null
}

function Invoke-Python {
  param([string[]]$Arguments)

  Push-Location $Root
  try {
    $output = & $Python @Arguments 2>&1
    $exitCode = $LASTEXITCODE
    return [PSCustomObject]@{
      ExitCode = $exitCode
      Output = ($output -join "`n")
    }
  }
  finally {
    Pop-Location
  }
}

function Assert-Contains {
  param(
    [string]$Text,
    [string]$Expected,
    [string]$Context
  )
  if ($Text -notlike "*$Expected*") {
    Add-Failure "$Context missing expected text: $Expected"
  }
}

function Assert-GeneratedMatchesGolden {
  param(
    [string]$Profile,
    [string]$InputPath,
    [string]$GoldenPath
  )

  $generator = ".agents\skills\sap-s4hana-authorization-security\scripts\generate_authorization_review_pack.py"
  $result = Invoke-Python @($generator, "--profile", $Profile, $InputPath)
  if ($result.ExitCode -ne 0) {
    Add-Failure "Generator failed for $InputPath with exit $($result.ExitCode): $($result.Output)"
    return
  }

  $goldenFullPath = Join-Path $Root $GoldenPath
  if (-not (Test-Path -LiteralPath $goldenFullPath)) {
    Add-Failure "Missing golden output: $GoldenPath"
    return
  }

  $generated = $result.Output.Replace("`r`n", "`n").Trim()
  $golden = (Get-Content -Raw -LiteralPath $goldenFullPath).Replace("`r`n", "`n").Trim()
  if ($generated -ne $golden) {
    Add-Failure "Generated output differs from golden file: $GoldenPath"
  }
}

$validator = ".agents\skills\sap-s4hana-authorization-security\scripts\validate_authorization_evidence.py"
$generator = ".agents\skills\sap-s4hana-authorization-security\scripts\generate_authorization_review_pack.py"
$fioriSample = ".agents\samples\deliverables\sample-s4hana-fiori-access-matrix.csv"
$sodSample = ".agents\samples\deliverables\sample-sap-sod-control-matrix.csv"

$env:PYTHONPYCACHEPREFIX = Join-Path ([System.IO.Path]::GetTempPath()) "sap-auth-review-pycache"
$compile = Invoke-Python @("-m", "py_compile", $validator, $generator)
if ($compile.ExitCode -ne 0) {
  Add-Failure "Python compile failed: $($compile.Output)"
}

$fioriValidation = Invoke-Python @($validator, "--profile", "fiori-access", $fioriSample)
if ($fioriValidation.ExitCode -ne 1) {
  Add-Failure "Fiori validator should exit 1 for sample findings, got $($fioriValidation.ExitCode)"
}
Assert-Contains $fioriValidation.Output "row 2 has unresolved validation/control status: Open" "Fiori validation"
Assert-Contains $fioriValidation.Output "row 3 has unresolved validation/control status: Open" "Fiori validation"

$sodValidation = Invoke-Python @($validator, "--profile", "sod-control", $sodSample)
if ($sodValidation.ExitCode -ne 1) {
  Add-Failure "SoD validator should exit 1 for sample findings, got $($sodValidation.ExitCode)"
}
Assert-Contains $sodValidation.Output "row 1 has unresolved validation/control status: Missing" "SoD validation"
Assert-Contains $sodValidation.Output "row 3 has unresolved validation/control status: Missing" "SoD validation"

$malformedPath = Join-Path ([System.IO.Path]::GetTempPath()) "sap-auth-malformed-evidence.csv"
Set-Content -LiteralPath $malformedPath -Encoding utf8 -Value @(
  "ProcessRole,BusinessTask",
  "Procure-to-Pay Buyer,Create purchase order"
)
$malformedValidation = Invoke-Python @($validator, "--profile", "fiori-access", $malformedPath)
Remove-Item -LiteralPath $malformedPath -Force
if ($malformedValidation.ExitCode -ne 1) {
  Add-Failure "Malformed validator should exit 1 for missing columns, got $($malformedValidation.ExitCode)"
}
Assert-Contains $malformedValidation.Output "missing required columns" "Malformed validation"

Assert-GeneratedMatchesGolden `
  -Profile "fiori-access" `
  -InputPath $fioriSample `
  -GoldenPath ".agents\samples\deliverables\golden-s4hana-fiori-access-review-pack.md"

Assert-GeneratedMatchesGolden `
  -Profile "sod-control" `
  -InputPath $sodSample `
  -GoldenPath ".agents\samples\deliverables\golden-sap-sod-control-review-pack.md"

$outputPath = Join-Path ([System.IO.Path]::GetTempPath()) "sap-auth-review-pack-output.md"
$outputResult = Invoke-Python @($generator, "--profile", "fiori-access", "--output", $outputPath, $fioriSample)
if ($outputResult.ExitCode -ne 0) {
  Add-Failure "Generator --output failed with exit $($outputResult.ExitCode): $($outputResult.Output)"
}
elseif (-not (Test-Path -LiteralPath $outputPath)) {
  Add-Failure "Generator --output did not create expected file"
}
Remove-Item -LiteralPath $outputPath -Force -ErrorAction SilentlyContinue

if ($Failures.Count -gt 0) {
  Write-Host "SAP authorization review-pack regression failed:" -ForegroundColor Red
  foreach ($failure in $Failures) {
    Write-Host " - $failure" -ForegroundColor Red
  }
  exit 1
}

Write-Host "SAP authorization review-pack regression passed." -ForegroundColor Green
Write-Host "Checked Python compile, expected validator findings, malformed evidence handling, golden output parity, and generator --output behavior."
