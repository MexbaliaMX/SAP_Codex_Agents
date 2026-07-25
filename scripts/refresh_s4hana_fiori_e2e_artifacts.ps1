param(
  [string]$Date = '2026-07-19'
)

$ErrorActionPreference = 'Stop'
$Deliverables = 'docs/deliverables'
$Validation = 'docs/validation'
$TraceabilityCsv = Join-Path $Deliverables 'sap-content-cross-source-traceability.csv'
$FarlRefreshReportCsv = Join-Path $Validation 's4hana-fiori-farl-refresh-validation-report.csv'
$FarlRefreshReportMd = Join-Path $Validation 's4hana-fiori-farl-refresh-validation-report.md'
$CatalogFiles = @(
  'docs/deliverables/s4hana-fiori-fi-r2r-app-inventory.md',
  'docs/deliverables/s4hana-fiori-p2p-s2p-app-inventory.md',
  'docs/deliverables/s4hana-fiori-o2c-l2c-app-inventory.md',
  'docs/deliverables/s4hana-fiori-plan-to-produce-app-inventory.md',
  'docs/deliverables/s4hana-fiori-design-to-operate-app-inventory.md',
  'docs/deliverables/s4hana-fiori-hire-to-retire-app-inventory.md'
)

function CleanCell($s) {
  if ($null -eq $s) { return '' }
  return ($s -replace '<br>', '; ' -replace '\s+', ' ').Trim()
}

function Split-TableRow($line) {
  $t = $line.Trim()
  if ($t.StartsWith('|')) { $t = $t.Substring(1) }
  if ($t.EndsWith('|')) { $t = $t.Substring(0, $t.Length - 1) }
  return @($t -split '\|' | ForEach-Object { CleanCell $_ })
}

function Get-ProcessInfo($file) {
  switch -Wildcard ($file) {
    '*fi-r2r*' { return @{ Family = 'Record-to-Report'; Source = 'R2R/FI' } }
    '*p2p-s2p*' { return @{ Family = 'Source-to-Pay / Procure-to-Pay'; Source = 'P2P/S2P' } }
    '*o2c-l2c*' { return @{ Family = 'Lead-to-Cash / Order-to-Cash'; Source = 'O2C/L2C' } }
    '*plan-to-produce*' { return @{ Family = 'Plan-to-Produce'; Source = 'P2Produce' } }
    '*design-to-operate*' { return @{ Family = 'Design-to-Operate'; Source = 'D2Operate' } }
    '*hire-to-retire*' { return @{ Family = 'Hire-to-Retire'; Source = 'H2R' } }
    default { return @{ Family = 'Unmapped'; Source = 'Unmapped' } }
  }
}

function Get-MexicoFlag($row) {
  $text = (($row.ProcessFamily, $row.Subprocess, $row.AppName, $row.AppId, $row.Catalog, $row.Component) -join ' ')
  if ($row.ProcessFamily -eq 'Lead-to-Cash / Order-to-Cash' -and $text -match 'billing|invoice|payment|receivable|credit|debit|delivery|shipment|return|freight|transport|material|document|accounting|journal|clearing|collection|dispute') { return 'Review' }
  if ($row.ProcessFamily -eq 'Source-to-Pay / Procure-to-Pay' -and $text -match 'invoice|payment|purchase order|goods receipt|service entry|supplier|contract|freight|delivery|material|accounting|journal|clearing|approval') { return 'Review' }
  if ($row.ProcessFamily -eq 'Record-to-Report' -and $text -match 'journal|ledger|asset|payment|clearing|bank|tax|report|financial|account|close|invoice') { return 'Review' }
  if ($row.ProcessFamily -eq 'Plan-to-Produce' -and $text -match 'material|goods|stock|inventory|cost|accounting|inspection|usage decision|defect|batch|serial|production order|process order|confirmation|quality') { return 'Review' }
  if ($row.ProcessFamily -eq 'Design-to-Operate' -and $text -match 'maintenance|order|notification|permit|safety|isolation|inspection|quality|defect|usage decision|chemical|dangerous goods|marketability|safety data|serial|stock|BOM|change|equipment|asset') { return 'Review' }
  if ($row.ProcessFamily -eq 'Hire-to-Retire' -and $text -match 'payroll|paystub|travel|expense|timesheet|time|leave|overtime|employee|workforce|staff|settlement|journal|cost|activity|internal order|access') { return 'Review' }
  return 'No flagged'
}

function Read-Catalog($file) {
  $info = Get-ProcessInfo $file
  $lines = Get-Content -LiteralPath $file
  $rows = @()
  $mode = $null
  foreach ($line in $lines) {
    if ($line -match '^## Inventario curado') { $mode = 'curated'; continue }
    if ($line -match '^## Fallbacks SAP GUI controlados') { $mode = 'fallback'; continue }
    if ($line -match '^## ' -and $mode) { $mode = $null; continue }
    if (-not $mode -or $line -notmatch '^\|') { continue }
    if ($line -match '^\|\s*---' -or $line -match '^\|\s*Proceso\s*\|') { continue }
    $c = Split-TableRow $line
    if ($c.Count -lt 8) { continue }
    if ($mode -eq 'curated') {
      $role = $c[4]; $release = $c[5]; $cloud = $c[6]; $catalog = $c[7]; $component = if ($c.Count -ge 9) { $c[8] } else { '' }
      $usage = if ($c[3] -eq 'Web Dynpro') { 'Standard / legacy UI' } elseif ($c[3] -eq 'SAP GUI') { 'SAP GUI fallback' } else { 'Standard / curated' }
    } else {
      $role = 'Other'; $release = $c[4]; $cloud = $c[5]; $catalog = $c[6]; $component = $c[7]; $usage = 'SAP GUI fallback'
    }
    $row = [pscustomobject]@{
      ProcessFamily = $info.Family
      Source = $info.Source
      Subprocess = $c[0]
      AppId = $c[1]
      AppName = $c[2]
      AppType = $c[3]
      Role = $role
      ReleaseAnchor = $release
      PublicCloud2602 = $cloud
      Catalog = $catalog
      Component = $component
      UsageType = $usage
      MexicoRelevant = ''
      ValidationStatus = 'FARL sourced; tenant validation pending'
      SourceFile = $file
    }
    $row.MexicoRelevant = Get-MexicoFlag $row
    $rows += $row
  }
  return $rows
}

function Get-OwnerForProcess($processFamily) {
  switch ($processFamily) {
    'Record-to-Report' { return 'Finance R2R Owner' }
    'Source-to-Pay / Procure-to-Pay' { return 'Procurement Owner' }
    'Lead-to-Cash / Order-to-Cash' { return 'Sales / Billing Owner' }
    'Plan-to-Produce' { return 'Manufacturing / Supply Chain Owner' }
    'Design-to-Operate' { return 'Operations / Maintenance / Quality / EHS Owner' }
    'Hire-to-Retire' { return 'HR / Payroll / Finance Integration Owner' }
    default { return 'Solution Architecture Lead' }
  }
}

function Get-MexicoCue($flag) {
  if ($flag -eq 'Review') { return 'Audit / SoD / Mexico validation pending' }
  return 'Not flagged'
}

function New-TraceabilityRows($fitRows) {
  $i = 1
  foreach ($f in $fitRows) {
    [pscustomobject]@{
      TraceabilityId = ('SCI-TRACE-{0:0000}' -f $i)
      ProcessFamily = $f.ProcessFamily
      ProcessStage = $f.Subprocess
      ScopeItemCandidate = Get-ScopeCandidate $f
      ScopeItemId = 'TBD - validate in SAP Process Navigator / tenant'
      FioriAppId = $f.AppId
      FioriAppName = $f.AppName
      BusinessRole = $f.Role
      BusinessCatalog = $f.Catalog
      TechnicalCatalog = 'TBD'
      ApplicationComponent = $f.Component
      ApiOrArtifactId = 'Not applicable - FARL refresh only'
      ApiOrArtifactType = 'Not applicable'
      ApiOrArtifactName = 'Not applicable'
      BtpService = 'Not applicable - FARL refresh only'
      BtpServicePlan = 'Not applicable'
      BtpMission = 'Not applicable'
      SignavioProcess = 'TBD - SCI-006 pending'
      SignavioVariant = 'TBD - SCI-006 pending'
      DeploymentModel = if ($f.PublicCloud2602 -eq 'Si') { 'Public Cloud / Private Cloud Edition / On-Premise validation pending' } else { 'Private Cloud Edition / On-Premise; Public Cloud validation pending' }
      ReleaseAnchor = $f.ReleaseAnchor
      CountryOverlay = if ($f.MexicoRelevant -eq 'Review') { 'Mexico' } else { 'Global' }
      MexicoComplianceCue = Get-MexicoCue $f.MexicoRelevant
      SourceSystem = 'FARL'
      SourceUrl = 'https://fioriappslibrary.hana.ondemand.com/sap/fix/externalViewer/'
      SourceQuery = $f.AppId
      SourceRetrievedOn = $Date
      EvidenceLevel = 'FARL sourced'
      ValidationStatus = 'Tenant validation pending'
      RefreshRequiredBeforeUse = 'Yes, before project use or derived matrix refresh'
      OpenGaps = 'Tenant activation, official scope item, business role/catalog, launchpad visibility, edition and licensing not confirmed'
      Owner = Get-OwnerForProcess $f.ProcessFamily
      NextAction = 'Validate app, role/catalog and scope item before client commitment'
      Notes = ('SourceFile=' + $f.SourceFile)
    }
    $i++
  }
}

function Assert-TraceabilitySchema($rows) {
  $required = @(
    'TraceabilityId','ProcessFamily','ProcessStage','ScopeItemCandidate','ScopeItemId','FioriAppId','FioriAppName',
    'BusinessRole','BusinessCatalog','TechnicalCatalog','ApplicationComponent','ApiOrArtifactId','ApiOrArtifactType',
    'ApiOrArtifactName','BtpService','BtpServicePlan','BtpMission','SignavioProcess','SignavioVariant','DeploymentModel',
    'ReleaseAnchor','CountryOverlay','MexicoComplianceCue','SourceSystem','SourceUrl','SourceQuery','SourceRetrievedOn',
    'EvidenceLevel','ValidationStatus','RefreshRequiredBeforeUse','OpenGaps','Owner','NextAction','Notes'
  )
  if ($rows.Count -eq 0) { throw 'Traceability export has no rows.' }
  $columns = @($rows[0].PSObject.Properties.Name)
  $missing = @($required | Where-Object { $_ -notin $columns })
  if ($missing.Count -gt 0) { throw ('Traceability export missing required columns: ' + ($missing -join ', ')) }
}

function New-FarlRefreshValidationRows($masterRows, $fitRows, $roleRows, $mexRows, $scopeRows, $validationRows, $traceabilityRows) {
  $checks = @(
    @{ CheckId = 'FARL-001'; CheckName = 'Master rows generated'; Status = if ($masterRows.Count -gt 0) { 'Pass' } else { 'Fail' }; Detail = "Rows=$($masterRows.Count)" },
    @{ CheckId = 'FARL-002'; CheckName = 'FARL caveat preserved'; Status = if (($masterRows | Where-Object { $_.ValidationStatus -ne 'FARL sourced; tenant validation pending' }).Count -eq 0) { 'Pass' } else { 'Fail' }; Detail = 'Expected every master row to preserve FARL sourced tenant validation caveat' },
    @{ CheckId = 'FARL-003'; CheckName = 'Release anchors populated'; Status = if (($masterRows | Where-Object { [string]::IsNullOrWhiteSpace($_.ReleaseAnchor) }).Count -eq 0) { 'Pass' } else { 'Fail' }; Detail = 'Expected ReleaseAnchor on every master row' },
    @{ CheckId = 'FARL-004'; CheckName = 'App IDs populated'; Status = if (($masterRows | Where-Object { [string]::IsNullOrWhiteSpace($_.AppId) }).Count -eq 0) { 'Pass' } else { 'Fail' }; Detail = 'Expected AppId on every master row' },
    @{ CheckId = 'FARL-005'; CheckName = 'Business catalogs populated or explicitly flagged'; Status = if (($masterRows | Where-Object { [string]::IsNullOrWhiteSpace($_.Catalog) }).Count -eq 0) { 'Pass' } else { 'Fail' }; Detail = 'Expected Catalog value or controlled fallback marker on every master row' },
    @{ CheckId = 'FARL-006'; CheckName = 'Traceability uses FARL only'; Status = if (($traceabilityRows | Where-Object { $_.SourceSystem -ne 'FARL' }).Count -eq 0) { 'Pass' } else { 'Fail' }; Detail = 'No Business Accelerator Hub, Discovery Center or Signavio rows expected in SCI-003' },
    @{ CheckId = 'FARL-007'; CheckName = 'Traceability evidence preserved'; Status = if (($traceabilityRows | Where-Object { $_.EvidenceLevel -ne 'FARL sourced' -or $_.ValidationStatus -ne 'Tenant validation pending' }).Count -eq 0) { 'Pass' } else { 'Fail' }; Detail = 'Expected FARL sourced / Tenant validation pending on every traceability row' },
    @{ CheckId = 'FARL-008'; CheckName = 'Derived matrices regenerated'; Status = if ($fitRows.Count -eq $masterRows.Count -and $roleRows.Count -eq $masterRows.Count -and $scopeRows.Count -eq $masterRows.Count) { 'Pass' } else { 'Fail' }; Detail = "Master=$($masterRows.Count); Fit=$($fitRows.Count); Role=$($roleRows.Count); Scope=$($scopeRows.Count); Mexico=$($mexRows.Count); ScopeValidation=$($validationRows.Count)" }
  )
  foreach ($c in $checks) {
    [pscustomobject]@{
      CheckId = $c.CheckId
      CheckName = $c.CheckName
      Status = $c.Status
      Detail = $c.Detail
      CheckedOn = $Date
      EvidenceLevel = 'FARL sourced / Derived'
      OpenGaps = 'Tenant activation, official scope items, licensing, edition, spaces/pages and production readiness remain pending'
    }
  }
}

function Write-FarlRefreshReport($rows) {
  $rows | Export-Csv -LiteralPath $FarlRefreshReportCsv -NoTypeInformation -Encoding UTF8
  $groups = $rows | Group-Object Status | Sort-Object Name
  $lines = @(
    '# SAP Fiori FARL Refresh Validation Report',
    '',
    "Fecha de preparacion: $Date",
    '',
    '## Proposito',
    '',
    'Este reporte valida el refresh controlado de artefactos FARL-sourced y sus matrices derivadas. No prueba activacion tenant, scope item oficial, licenciamiento, edition, roles productivos ni disponibilidad en launchpad.',
    '',
    '## Resultado',
    '',
    '| Status | Checks |',
    '| --- | ---: |'
  )
  foreach ($g in $groups) { $lines += "| $($g.Name) | $($g.Count) |" }
  $lines += @(
    '',
    '## Checks',
    '',
    '| CheckId | CheckName | Status | Detail |',
    '| --- | --- | --- | --- |'
  )
  foreach ($r in $rows) { $lines += "| $($r.CheckId) | $($r.CheckName) | $($r.Status) | $($r.Detail) |" }
  $lines += @(
    '',
    '## Validaciones abiertas',
    '',
    '- Confirmar activacion en tenant, business roles, catalogs, spaces/pages, OData/ICF y visibilidad launchpad.',
    '- Confirmar scope items oficiales, test scripts y process flows contra SAP Process Navigator, SAP Best Practices o tenant.',
    '- Confirmar edition, pais, industria, licenciamiento, configuracion y restricciones de localizacion.',
    '- Mantener Business Accelerator Hub, Discovery Center y Signavio fuera del refresh SCI-003.'
  )
  Set-Content -LiteralPath $FarlRefreshReportMd -Value $lines -Encoding UTF8
}

function Get-WorkshopInfo($r) {
  $t = (($r.Subprocess, $r.AppName, $r.Component, $r.Catalog) -join ' ')
  switch ($r.ProcessFamily) {
    'Design-to-Operate' {
      if ($t -match 'BOM|Product Structure|Engineering|Change|Specification|Product master') { return @('D2Operate product lifecycle and engineering change', 'Engineering / PLM Owner') }
      if ($t -match 'Equipment|Functional Location|Technical Object|Measuring|Serial|Asset|Reference|Linear') { return @('D2Operate asset and technical object foundation', 'Maintenance Master Data Owner') }
      if ($t -match 'Permit|Safety Certificate|Isolation|Work Permit') { return @('D2Operate permit-to-work and operational safety', 'Maintenance / EHS Owner') }
      if ($t -match 'Quality|Inspection|Usage Decision|Defect') { return @('D2Operate quality, defects and inspection', 'Quality Owner') }
      if ($t -match 'Chemical|Dangerous Goods|Marketability|Safety Data|EHS') { return @('D2Operate EHS and product compliance', 'EHS / Product Compliance Owner') }
      return @('D2Operate maintenance planning, orders and execution', 'Maintenance Planner / Operations Owner')
    }
    'Plan-to-Produce' {
      if ($t -match 'MRP|PIR|Forecast|Coverage|Planned|Requirements') { return @('P2Produce demand, MRP and planned orders', 'Planning Owner') }
      if ($t -match 'Production Order|Process Order|Confirmation|Operation') { return @('P2Produce production and process order execution', 'Manufacturing Owner') }
      if ($t -match 'Work Center|Routing|Production Version|Capacity') { return @('P2Produce master data, routings and capacity', 'Manufacturing Owner') }
      if ($t -match 'Stock|Material Document|Goods|Inventory|Reservation|Batch') { return @('P2Produce inventory, staging and goods movements', 'Inventory / Warehouse Owner') }
      if ($t -match 'Inspection|Quality|Defect|Usage') { return @('P2Produce quality inspection and usage decision', 'Quality Owner') }
      if ($t -match 'Cost|Accounting|WIP|Line Items') { return @('P2Produce costing and R2R handoff', 'Finance / Costing Owner') }
      if ($t -match 'Kanban|Supply|Replenishment') { return @('P2Produce lean, Kanban and supply to production', 'Manufacturing Owner') }
      return @('P2Produce controls and analytics', 'Manufacturing Owner')
    }
    'Lead-to-Cash / Order-to-Cash' {
      if ($t -match 'Billing|Invoice|Credit Memo|Debit Memo|Returns') { return @('O2C billing, returns and credit memo', 'Sales / Billing Owner') }
      if ($t -match 'Payment|Receivable|Collection|Dispute|Clearing|Cash') { return @('O2C receivables, payments, disputes and collections', 'Finance AR / Treasury Owner') }
      if ($t -match 'Delivery|Shipment|Freight|Transport|Goods Issue|Picking') { return @('O2C delivery, logistics and Carta Porte touchpoints', 'Logistics / Shipping Owner') }
      if ($t -match 'Sales Order|Quotation|Contract|Customer|Price|Credit') { return @('L2C/O2C commercial document flow', 'Sales / Customer Service Owner') }
      return @('O2C analytics and controls', 'Sales / Billing Owner')
    }
    'Source-to-Pay / Procure-to-Pay' {
      if ($t -match 'Sourcing|RFQ|Quotation|Contract|Source|Supplier Evaluation') { return @('S2P sourcing, contracts and source determination', 'Procurement Owner') }
      if ($t -match 'Purchase Requisition|Requisition|Purchase Order|Approval') { return @('P2P requisition, purchase order and approvals', 'Procurement Owner') }
      if ($t -match 'Goods Receipt|Service Entry|Material Document|Stock|Inventory') { return @('P2P receiving, service entry and logistics evidence', 'Procurement / Inventory Owner') }
      if ($t -match 'Invoice|Payment|Supplier|Clearing') { return @('P2P invoice verification, AP and payment handoff', 'Finance AP Owner') }
      return @('P2P analytics, spend control and governance', 'Procurement Owner')
    }
    'Record-to-Report' {
      if ($t -match 'Journal|Ledger|G/L|Close|Financial Statement|Trial Balance') { return @('R2R general ledger, close and controls', 'Finance R2R Owner') }
      if ($t -match 'Asset|Depreciation|Capital') { return @('R2R asset accounting and capitalization', 'Fixed Assets Owner') }
      if ($t -match 'Payment|Bank|Cash|Clearing|Receivable|Payable') { return @('R2R banking, payments and cash operations', 'Finance AR/AP + Treasury Owner') }
      return @('R2R reporting, analytics and compliance', 'Finance R2R Owner')
    }
    'Hire-to-Retire' {
      if ($t -match 'Leave|Overtime|Time Event|Timesheet|Missing Time') { return @('H2R time, leave, overtime and attendance', 'HR Time / Payroll Owner') }
      if ($t -match 'Travel|Expense') { return @('H2R travel, expenses and reimbursement', 'Travel / Finance AP Owner') }
      if ($t -match 'Workforce|Employee|Paystub|Position') { return @('H2R workforce foundation and employee self-service', 'HR Operations Owner') }
      if ($t -match 'Staff|Resource|Project') { return @('H2R project staffing and resource management', 'Project / Resource Owner') }
      if ($t -match 'Personnel Settlement|Settlement') { return @('H2R personnel settlement and commissions', 'Settlement / Sales Ops Owner') }
      if ($t -match 'Payroll|Journal|Line Items|Activity|Cost Center|Internal Order') { return @('H2R payroll, costing and finance handoff', 'Payroll / Finance Owner') }
      return @('H2R access, controls and analytics', 'HR / Security Owner')
    }
  }
  return @('Cross-process validation', 'Solution Architecture Lead')
}

function Get-ScopeCandidate($f) {
  $t = (($f.Workshop, $f.Subprocess, $f.AppName, $f.Component) -join ' ')
  if ($f.ProcessFamily -eq 'Record-to-Report') {
    if ($t -match 'Asset') { return 'Asset Accounting' }
    if ($t -match 'Payment|Bank|Cash|Payable|Receivable') { return 'Bank, AP/AR and payment operations' }
    if ($t -match 'Close|Ledger|Journal|G/L') { return 'General Ledger Accounting and Financial Close' }
    return 'Finance analytics and compliance'
  }
  if ($f.ProcessFamily -eq 'Source-to-Pay / Procure-to-Pay') {
    if ($t -match 'Sourcing|RFQ|Contract|Supplier Evaluation') { return 'Sourcing, supplier management and contracts' }
    if ($t -match 'Requisition|Purchase Order|Approval') { return 'Operational procurement and approvals' }
    if ($t -match 'Goods|Service|Inventory|Receipt') { return 'Goods receipt, service entry and logistics evidence' }
    if ($t -match 'Invoice|Payment|Supplier') { return 'Invoice management and AP handoff' }
    return 'Procurement analytics and spend control'
  }
  if ($f.ProcessFamily -eq 'Lead-to-Cash / Order-to-Cash') {
    if ($t -match 'Sales Order|Quotation|Contract|Customer|Credit') { return 'Sales order management and commercial controls' }
    if ($t -match 'Delivery|Shipment|Transport|Freight') { return 'Outbound delivery and transportation' }
    if ($t -match 'Billing|Invoice|Credit Memo|Debit Memo|Returns') { return 'Billing, returns and credit memo processing' }
    if ($t -match 'Payment|Receivable|Collection|Dispute') { return 'Accounts receivable, collections and payment processing' }
    return 'Sales analytics and controls'
  }
  if ($f.ProcessFamily -eq 'Plan-to-Produce') {
    if ($t -match 'MRP|PIR|Forecast|Coverage|Planned') { return 'Material requirements planning and production planning' }
    if ($t -match 'Production Order|Process Order|Confirmation') { return 'Manufacturing execution and confirmations' }
    if ($t -match 'Work Center|Routing|Production Version|Capacity') { return 'Manufacturing master data, routings and capacity' }
    if ($t -match 'Inventory|Stock|Goods|Batch|Material Document') { return 'Inventory management and production goods movements' }
    if ($t -match 'Inspection|Quality|Defect|Usage') { return 'Quality management in production' }
    if ($t -match 'Cost|Accounting|WIP') { return 'Product costing and production accounting' }
    return 'Manufacturing planning and controls'
  }
  if ($f.ProcessFamily -eq 'Design-to-Operate') {
    if ($t -match 'Permit|Safety|Isolation') { return 'Permit-to-work and operational safety' }
    if ($t -match 'Quality|Inspection|Defect|Usage') { return 'Quality management and defect processing' }
    if ($t -match 'Chemical|Dangerous|Marketability|Safety Data|EHS') { return 'EHS and product compliance' }
    if ($t -match 'BOM|Product Structure|Engineering|Change|Specification|Bill of Material') { return 'Engineering change management and product structures' }
    if ($t -match 'Equipment|Functional|Technical Object|Measuring|Serial|Asset|Reference|Linear') { return 'Technical object and asset master data' }
    return 'Maintenance management, planning and execution'
  }
  if ($f.ProcessFamily -eq 'Hire-to-Retire') {
    if ($t -match 'Leave|Overtime|Time Event|Timesheet|Missing Time') { return 'Time management, leave and attendance' }
    if ($t -match 'Travel|Expense') { return 'Travel and expense management' }
    if ($t -match 'Workforce|Employee|Paystub|Position') { return 'Workforce foundation and employee self-service' }
    if ($t -match 'Staff|Resource|Project') { return 'Project staffing and resource management' }
    if ($t -match 'Personnel Settlement|Settlement') { return 'Personnel settlement and commissions' }
    if ($t -match 'Payroll|Journal|Line Items|Activity|Cost Center|Internal Order') { return 'Payroll accounting and finance handoff' }
    return 'H2R access, controls and analytics'
  }
  return 'Cross-process scope validation'
}

function Write-SummaryMd($path, $title, $purpose, $csv, $rows, $groupField) {
  $groups = $rows | Group-Object $groupField | Sort-Object Name
  $lines = @(
    "# $title",
    '',
    "Fecha de preparacion: $Date",
    '',
    '## Proposito',
    '',
    $purpose,
    '',
    '## Fuentes',
    '',
    ('- CSV generado: `' + $csv + '`'),
    '',
    '## Resumen',
    '',
    "- Total de filas: $($rows.Count)",
    "- Agrupaciones: $($groups.Count)",
    '',
    '## Agrupaciones',
    '',
    "| $groupField | Filas |",
    '| --- | ---: |'
  )
  foreach ($g in $groups) { $lines += "| $($g.Name) | $($g.Count) |" }
  $lines += @(
    '',
    '## Validaciones abiertas',
    '',
    '- Confirmar scope items, business roles, catalogs, spaces/pages y evidencia tenant.',
    '- Confirmar edition, pais, industria, licenciamiento, configuracion y restricciones de localizacion.',
    '- Tratar esta matriz como derivada de los catalogos FARL, no como prueba productiva.'
  )
  Set-Content -LiteralPath $path -Value $lines -Encoding UTF8
}

$master = @()
foreach ($file in $CatalogFiles) { $master += Read-Catalog $file }
$master = $master | Sort-Object ProcessFamily, Source, Subprocess, AppId, AppName
$masterCsv = Join-Path $Deliverables 's4hana-fiori-e2e-master-app-index.csv'
$master | Export-Csv -LiteralPath $masterCsv -NoTypeInformation -Encoding UTF8
Write-SummaryMd (Join-Path $Deliverables 's4hana-fiori-e2e-master-app-index.md') 'Indice Maestro SAP Fiori Apps E2E' 'Este indice consolida los catalogos E2E SAP Fiori en una sola vista searchable y comparable para discovery, fit-to-standard, seguridad y preparacion de pruebas.' 'docs/deliverables/s4hana-fiori-e2e-master-app-index.csv' $master 'ProcessFamily'

$fit = foreach ($r in $master) {
  $wi = Get-WorkshopInfo $r
  $priority = if ($r.UsageType -eq 'SAP GUI fallback' -or $r.MexicoRelevant -eq 'Review' -or $r.PublicCloud2602 -ne 'Si') { 'High' } else { 'Medium' }
  $risk = if ($r.UsageType -eq 'SAP GUI fallback') { 'Fallback approval' } elseif ($r.MexicoRelevant -eq 'Review') { 'Mexico fiscal/audit review' } elseif ($r.PublicCloud2602 -ne 'Si') { 'Edition/scope validation' } else { 'Standard validation' }
  [pscustomobject]@{
    Workshop = $wi[0]; Workstream = $r.ProcessFamily; BusinessOwner = $wi[1]; Priority = $priority
    FitGapDecision = 'TBD - standard first'; DecisionStatus = 'Open'
    ScopeItem = 'TBD - validate against SAP Process Navigator / tenant scope'
    TestScript = 'TBD - link Cloud ALM / test evidence'
    TenantEvidence = 'Pending - app visibility, role/catalog and demo evidence required'
    OpenQuestions = 'Is this app available for the target edition, scope item and tenant roles?'
    KeyValidation = 'FARL reviewed; business role/catalog assigned; launchpad visible; scope item and demo evidence attached'
    RiskFlag = $risk; FollowUpAction = 'Review in workshop, capture decision owner, attach evidence, update decision status'
    ProcessFamily = $r.ProcessFamily; Source = $r.Source; Subprocess = $r.Subprocess; AppId = $r.AppId; AppName = $r.AppName
    AppType = $r.AppType; Role = $r.Role; ReleaseAnchor = $r.ReleaseAnchor; PublicCloud2602 = $r.PublicCloud2602
    Catalog = $r.Catalog; Component = $r.Component; UsageType = $r.UsageType; MexicoRelevant = $r.MexicoRelevant
    SourceValidationStatus = $r.ValidationStatus; SourceFile = $r.SourceFile
  }
}
$fitCsv = Join-Path $Deliverables 's4hana-fiori-fit-to-standard-workshop-matrix.csv'
$fit | Export-Csv -LiteralPath $fitCsv -NoTypeInformation -Encoding UTF8
Write-SummaryMd (Join-Path $Deliverables 's4hana-fiori-fit-to-standard-workshop-matrix.md') 'Fit-to-Standard Workshop Matrix SAP Fiori E2E' 'Esta matriz convierte el indice maestro en un tracker de workshop para SAP Activate Explore / Fit-to-Standard.' 'docs/deliverables/s4hana-fiori-fit-to-standard-workshop-matrix.csv' $fit 'Workshop'

$roleRows = foreach ($f in $fit) {
  $criticality = if ($f.UsageType -eq 'SAP GUI fallback') { 'Restricted fallback' } elseif ($f.MexicoRelevant -eq 'Review') { 'Business control' } elseif ($f.Catalog -eq 'Without Catalog Assignment') { 'Catalog validation' } else { 'Standard role design' }
  [pscustomobject]@{
    ProcessFamily = $f.ProcessFamily
    SecurityWorkshop = if ($f.ProcessFamily -eq 'Hire-to-Retire') { 'HR, payroll, travel and employee data role design' } elseif ($f.ProcessFamily -eq 'Design-to-Operate') { 'Operations, maintenance, quality and EHS role design' } elseif ($f.ProcessFamily -eq 'Plan-to-Produce') { 'Manufacturing, quality and costing role design' } elseif ($f.ProcessFamily -eq 'Lead-to-Cash / Order-to-Cash') { 'Sales, logistics, billing and AR role design' } elseif ($f.ProcessFamily -eq 'Source-to-Pay / Procure-to-Pay') { 'Procurement, receiving and AP role design' } else { 'Finance and close role design' }
    FitToStandardWorkshop = $f.Workshop; BusinessOwner = $f.BusinessOwner; FARLRole = $f.Role; BusinessCatalog = $f.Catalog
    AppId = $f.AppId; AppName = $f.AppName; AppType = $f.AppType; Component = $f.Component; UsageType = $f.UsageType
    AccessCriticality = $criticality; RiskFlag = $f.RiskFlag; Priority = $f.Priority
    SoDReviewRequired = if ($criticality -eq 'Standard role design') { 'Review' } else { 'Yes' }
    SoDScenario = 'Validate create/change/display, approval, posting, release, fallback and cross-process conflicts'
    TenantRoleValidation = 'Pending - confirm business role, catalog assignment and restrictions in tenant'
    LaunchpadSpacePageValidation = if ($f.UsageType -eq 'SAP GUI fallback') { 'Required - confirm GUI tile/transaction exposure policy and launchpad target mapping' } else { 'Required - confirm space, page, tile/target mapping and app visibility' }
    FallbackApprovalRequired = if ($f.UsageType -eq 'SAP GUI fallback') { 'Yes' } else { 'No' }
    MexicoAuditReviewRequired = if ($f.MexicoRelevant -eq 'Review') { 'Yes' } else { 'No' }
    PublicCloud2602 = $f.PublicCloud2602; ReleaseAnchor = $f.ReleaseAnchor; DecisionStatus = $f.DecisionStatus
    FitGapDecision = $f.FitGapDecision; TenantEvidence = $f.TenantEvidence; SourceFile = $f.SourceFile
  }
}
$roleCsv = Join-Path $Deliverables 's4hana-fiori-role-business-catalog-matrix.csv'
$roleRows | Export-Csv -LiteralPath $roleCsv -NoTypeInformation -Encoding UTF8
Write-SummaryMd (Join-Path $Deliverables 's4hana-fiori-role-business-catalog-matrix.md') 'Role & Business Catalog Matrix SAP Fiori E2E' 'Esta matriz convierte el indice maestro y la matriz fit-to-standard en una vista de seguridad, roles, business catalogs, SoD, launchpad y aprobaciones de fallback.' 'docs/deliverables/s4hana-fiori-role-business-catalog-matrix.csv' $roleRows 'SecurityWorkshop'

function Get-ComplianceTopic($r) {
  $t = (($r.ProcessFamily, $r.Subprocess, $r.AppName, $r.Component, $r.BusinessCatalog) -join ' ')
  if ($t -match 'delivery|shipment|freight|transport|goods|material document|stock|serialized|equipment') { return 'Carta Porte / movement evidence; Accounting audit trail; SoD / restricted access' }
  if ($t -match 'invoice|billing|payment|receivable|payable|clearing|bank') { return 'CFDI / payment evidence; Accounting audit trail; SoD / restricted access' }
  if ($t -match 'maintenance|order|cost|confirmation|asset') { return 'Maintenance cost / asset audit trail; SoD / restricted access' }
  if ($t -match 'quality|inspection|usage|defect') { return 'Quality release evidence; Inventory/accounting audit trail; SoD / restricted access' }
  if ($t -match 'chemical|dangerous goods|safety data|marketability|EHS|permit|safety|isolation') { return 'EHS / product compliance evidence; Operational safety approval; SoD / restricted access' }
  return 'Audit evidence; SoD / restricted access'
}

$mexRows = foreach ($r in ($roleRows | Where-Object { $_.MexicoAuditReviewRequired -eq 'Yes' })) {
  $source = $fit | Where-Object { $_.AppId -eq $r.AppId -and $_.ProcessFamily -eq $r.ProcessFamily } | Select-Object -First 1
  [pscustomobject]@{
    ProcessFamily = $r.ProcessFamily; Subprocess = $source.Subprocess; AppId = $r.AppId; AppName = $r.AppName
    ComplianceTopic = Get-ComplianceTopic $r
    FiscalEvidenceRequired = 'XML/PDF, acuse, material/accounting/maintenance/quality document link, approval log and audit evidence where applicable'
    Owner = if ($r.ProcessFamily -eq 'Hire-to-Retire') { 'HR / Payroll / Travel / Security Owner' } elseif ($r.ProcessFamily -eq 'Design-to-Operate') { 'Operations / Maintenance / Quality / EHS Owner' } elseif ($r.ProcessFamily -eq 'Plan-to-Produce') { 'Manufacturing / Quality / Costing Owner' } elseif ($r.ProcessFamily -eq 'Lead-to-Cash / Order-to-Cash') { 'Sales / Logistics / Finance Owner' } elseif ($r.ProcessFamily -eq 'Source-to-Pay / Procure-to-Pay') { 'Procurement / AP / Inventory Owner' } else { 'Finance / Tax Owner' }
    RiskLevel = 'High'; TestScenario = 'Execute representative process step, capture fiscal/logistics/accounting/quality/maintenance evidence and reconcile to audit trail'
    TenantValidation = 'Pending - confirm app visibility, business role/catalog, launchpad space/page, configuration and execution evidence in tenant'
    PACSATValidation = 'Required where CFDI, complemento de pago or Carta Porte applies; otherwise mark not applicable with Tax approval'
    DRCeDocumentValidation = 'Pending - confirm DRC/eDocument relevance, status monitoring, error handling and evidence retention'
    AccountingReconciliation = 'Pending - link source document to accounting entry, material document, settlement, clearing or cost object where applicable'
    SoDReview = $r.SoDReviewRequired; AccessValidation = $r.TenantRoleValidation; LaunchpadValidation = $r.LaunchpadSpacePageValidation
    FitToStandardWorkshop = $r.FitToStandardWorkshop; FitGapDecision = $r.FitGapDecision; DecisionStatus = $r.DecisionStatus
    OpenQuestions = 'Is this app and process step relevant for the Mexico legal entity, fiscal flow, audit trail or operational control?'
    PublicCloud2602 = $r.PublicCloud2602; BusinessCatalog = $r.BusinessCatalog; Component = $r.Component; UsageType = $r.UsageType; SourceFile = $r.SourceFile
  }
}
$mexCsv = Join-Path $Deliverables 's4hana-mexico-compliance-tracker.csv'
$mexRows | Export-Csv -LiteralPath $mexCsv -NoTypeInformation -Encoding UTF8
Write-SummaryMd (Join-Path $Deliverables 's4hana-mexico-compliance-tracker.md') 'Mexico Compliance Tracker SAP Fiori E2E' 'Este tracker identifica filas que requieren revision Mexico por posible impacto fiscal, logistico, contable, operativo, calidad, EHS, Carta Porte, CFDI, complemento de pago, auditoria o SoD.' 'docs/deliverables/s4hana-mexico-compliance-tracker.csv' $mexRows 'ProcessFamily'

$scopeRows = foreach ($f in $fit) {
  [pscustomobject]@{
    ProcessFamily = $f.ProcessFamily; Source = $f.Source; Workshop = $f.Workshop; Subprocess = $f.Subprocess
    AppId = $f.AppId; AppName = $f.AppName
    ScopeItemId = 'TBD - validate in SAP Process Navigator / tenant'
    ScopeItemCandidate = Get-ScopeCandidate $f
    ScopeItemConfidence = 'Internally validated candidate - official scope ID pending'
    SAPBestPracticesValidation = 'Not confirmed - validate scope item, process flow, test script and country/edition availability'
    TenantScopeValidation = 'Pending - confirm activated scope and role visibility in tenant'
    TestScriptReference = 'TBD - link SAP Best Practices / Cloud ALM test script'
    BusinessOwner = $f.BusinessOwner; FitGapDecision = $f.FitGapDecision; DecisionStatus = $f.DecisionStatus
    PublicCloud2602 = $f.PublicCloud2602; BusinessCatalog = $f.Catalog; Component = $f.Component; SourceFile = $f.SourceFile
  }
}
$scopeCsv = Join-Path $Deliverables 's4hana-fiori-scope-item-mapping.csv'
$scopeRows | Export-Csv -LiteralPath $scopeCsv -NoTypeInformation -Encoding UTF8
Write-SummaryMd (Join-Path $Deliverables 's4hana-fiori-scope-item-mapping.md') 'Scope Item Mapping SAP Fiori E2E' 'Esta matriz agrega una capa de trazabilidad entre procesos E2E, workshops, apps Fiori y candidatos de scope item. Los IDs de scope item se mantienen como TBD hasta validarlos en SAP Process Navigator, SAP Best Practices o tenant del cliente.' 'docs/deliverables/s4hana-fiori-scope-item-mapping.csv' $scopeRows 'ScopeItemCandidate'

$validationRows = foreach ($g in ($scopeRows | Group-Object ProcessFamily, ScopeItemCandidate | Sort-Object Name)) {
  $sample = $g.Group | Select-Object -First 1
  $idsPending = ($g.Group | Where-Object { $_.ScopeItemId -like 'TBD*' }).Count
  $scriptsPending = ($g.Group | Where-Object { $_.TestScriptReference -like 'TBD*' }).Count
  [pscustomobject]@{
    ProcessFamily = $sample.ProcessFamily
    ScopeItemCandidate = $sample.ScopeItemCandidate
    Rows = $g.Count
    DistinctApps = (($g.Group | Select-Object -ExpandProperty AppId -Unique) | Measure-Object).Count
    CandidateMappingValidation = 'Pass - internally consistent candidate grouping'
    OfficialScopeItemIdValidation = if ($idsPending -eq 0) { 'Pass - official IDs populated' } else { 'Pending - official SAP Process Navigator / tenant validation required' }
    TestScriptValidation = if ($scriptsPending -eq 0) { 'Pass - test scripts populated' } else { 'Pending - SAP Best Practices / Cloud ALM test script required' }
    TenantScopeValidation = 'Pending - confirm activated scope, country, edition and business role visibility in tenant'
    RecommendedOwner = $sample.BusinessOwner
    EvidenceRequired = 'SAP Process Navigator scope item page, SAP Best Practices process flow/test script, tenant scope activation evidence, launchpad role/catalog evidence'
    ValidationDecision = if ($idsPending -eq 0 -and $scriptsPending -eq 0) { 'Validated' } else { 'Conditionally validated as candidate only' }
  }
}
$validationCsv = Join-Path $Deliverables 's4hana-fiori-scope-item-validation-report.csv'
$validationRows | Export-Csv -LiteralPath $validationCsv -NoTypeInformation -Encoding UTF8
$vg = $validationRows | Group-Object ValidationDecision | Sort-Object Name
$validationMd = @(
  '# Scope Item Mapping Validation Report',
  '',
  "Fecha de preparacion: $Date",
  '',
  '## Resultado',
  '',
  'La matriz fue validada internamente contra el indice maestro, workshops, owners y agrupaciones candidatas. No se confirmaron IDs oficiales de SAP Best Practices porque requieren SAP Process Navigator, SAP Best Practices o tenant del cliente. Por control de evidencia, las filas permanecen como candidatos hasta completar esa validacion.',
  '',
  '## Fuentes',
  '',
  '- Scope mapping: `docs/deliverables/s4hana-fiori-scope-item-mapping.csv`',
  '- Fit-to-Standard matrix: `docs/deliverables/s4hana-fiori-fit-to-standard-workshop-matrix.csv`',
  '- Master index: `docs/deliverables/s4hana-fiori-e2e-master-app-index.csv`',
  '',
  '## Resumen',
  '',
  "- Total de combinaciones proceso/candidato: $($validationRows.Count)",
  "- Total de filas scope mapping revisadas: $($scopeRows.Count)",
  '',
  '## Estado de validacion',
  '',
  '| ValidationDecision | Combinaciones |',
  '| --- | ---: |'
)
foreach ($g in $vg) { $validationMd += "| $($g.Name) | $($g.Count) |" }
$validationMd += @(
  '',
  '## Hallazgos',
  '',
  '- Las agrupaciones candidatas son consistentes con proceso, workshop, subprocess, componente y owner.',
  '- `ScopeItemId` permanece pendiente en todas las filas hasta validacion oficial.',
  '- `TestScriptReference` permanece pendiente en todas las filas hasta vincular SAP Best Practices o Cloud ALM.',
  '- No usar `ScopeItemCandidate` como alcance contractual; usarlo como cola de validacion para Explore.',
  '',
  '## Evidencia requerida para cierre',
  '',
  '1. SAP Process Navigator: scope item oficial, nombre, version, pais/edition y proceso.',
  '2. SAP Best Practices: process flow y test script aplicable.',
  '3. Tenant: scope activado, business role/catalog, launchpad visibility y demo evidence.',
  '4. Project tool: decision Fit/Gap, owner, fecha y evidencia adjunta.',
  '',
  '## Archivo CSV',
  '',
  '- `docs/deliverables/s4hana-fiori-scope-item-validation-report.csv`'
)
Set-Content -LiteralPath (Join-Path $Deliverables 's4hana-fiori-scope-item-validation-report.md') -Value $validationMd -Encoding UTF8

$traceabilityRows = @(New-TraceabilityRows $fit)
Assert-TraceabilitySchema $traceabilityRows
$traceabilityRows | Export-Csv -LiteralPath $TraceabilityCsv -NoTypeInformation -Encoding UTF8

$farlRefreshValidationRows = @(New-FarlRefreshValidationRows $master $fit $roleRows $mexRows $scopeRows $validationRows $traceabilityRows)
Write-FarlRefreshReport $farlRefreshValidationRows
$failedChecks = @($farlRefreshValidationRows | Where-Object { $_.Status -ne 'Pass' })
if ($failedChecks.Count -gt 0) {
  throw ('FARL refresh validation failed: ' + (($failedChecks | ForEach-Object { $_.CheckId + '=' + $_.Status }) -join ', '))
}

Write-Host "Master rows: $($master.Count)"
Write-Host "Fit rows: $($fit.Count)"
Write-Host "Role rows: $($roleRows.Count)"
Write-Host "Mexico rows: $($mexRows.Count)"
Write-Host "Scope rows: $($scopeRows.Count)"
Write-Host "Scope validation rows: $($validationRows.Count)"
Write-Host "Traceability rows: $($traceabilityRows.Count)"
Write-Host "FARL refresh checks: $($farlRefreshValidationRows.Count)"
