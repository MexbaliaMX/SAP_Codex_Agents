# Calculation Model

The calculator estimates effort in hours from extension counts, complexity, editable rates, and optional overhead.

## Inputs

- `counts`: object counts by extension type and complexity.
- `rates`: hours per object by extension type and complexity.
- `params`: hours per day and enabled overhead percentages.

Complexities:

- `muy-alta`
- `alta`
- `media`
- `baja`

## Formula

For each extension type:

```text
type_hours = sum(count(type, complexity) * rate(type, complexity))
```

Tier totals:

```text
tier_hours = sum(type_hours for types in tier)
base_total = sum(type_hours for all types)
```

Overhead is additive and calculated from `base_total`:

```text
overhead_hours = base_total * enabled_overhead_pct / 100
total_hours = base_total + overhead_hours
total_days = total_hours / hours_per_day
```

## Defaults And Normalization

- Counts are normalized as non-negative integers.
- Rates are normalized as non-negative numbers.
- `hoursPerDay` must be positive; otherwise the calculator uses `8`.
- Custom rates are deep-merged over defaults so missing custom entries do not silently become zero.

## Output Contract

The canonical result is:

```json
{
  "estimate": {
    "baseTotal": 0,
    "hoursPerDay": 8,
    "overheadHours": {},
    "overheadPercentages": {},
    "totalDays": 0,
    "totalHours": 0,
    "totalOverhead": 0,
    "totalOverheadPct": 0,
    "typeTotals": {},
    "tierTotals": {}
  },
  "advisoryWarnings": []
}
```

Compatibility aliases may also exist at the top level, but new consumers should use `estimate`.
