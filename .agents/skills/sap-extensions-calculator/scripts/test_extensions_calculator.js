const assert = require('node:assert/strict');
const {
    DEFAULT_EXTENSION_EFFORT_RATES,
    calculateExtensionsEstimate
} = require('./extensions_calculator');

function assertClose(actual, expected, label) {
    assert.ok(Math.abs(actual - expected) < 0.0001, `${label}: expected ${expected}, got ${actual}`);
}

const baseline = calculateExtensionsEstimate(
    { 't1-custom-fields': { baja: 1 } },
    DEFAULT_EXTENSION_EFFORT_RATES,
    { hoursPerDay: 8, govEnabled: false, testEnabled: false, docEnabled: false, intEnabled: false }
);

assertClose(baseline.estimate.baseTotal, 0.5, 'baseline estimate.baseTotal');
assertClose(baseline.estimate.totalHours, 0.5, 'baseline estimate.totalHours');
assertClose(baseline.baseTotal, baseline.estimate.baseTotal, 'compatibility baseTotal alias');
assert.ok(Array.isArray(baseline.advisoryWarnings), 'advisoryWarnings is an array');

const overhead = calculateExtensionsEstimate(
    { 't2-rap-managed-bo': { media: 1 } },
    DEFAULT_EXTENSION_EFFORT_RATES,
    {
        hoursPerDay: 8,
        govEnabled: true,
        govValue: 15,
        testEnabled: true,
        testValue: 35,
        docEnabled: true,
        docValue: 12,
        intEnabled: true,
        intValue: 15
    }
);

assertClose(overhead.estimate.baseTotal, 80, 'overhead baseTotal');
assertClose(overhead.estimate.totalOverhead, 61.6, 'overhead totalOverhead');
assertClose(overhead.estimate.totalHours, 141.6, 'overhead totalHours');

const emptyRates = calculateExtensionsEstimate(
    { 't1-custom-logic': { alta: 1 } },
    {},
    { hoursPerDay: 8, govEnabled: false, testEnabled: false, docEnabled: false, intEnabled: false }
);
assertClose(emptyRates.estimate.baseTotal, 16, 'empty custom rates use defaults');
assert.equal(
    emptyRates.advisoryWarnings.some(w => w.code === 'missing_custom_rate'),
    false,
    'empty custom rates do not produce missing_custom_rate warnings'
);

const warnings = calculateExtensionsEstimate(
    {
        't1-custom-logic': { 'muy-alta': 1 },
        't3-connectivity': { baja: 1 }
    },
    { 't3-connectivity': { baja: 13 } },
    { hoursPerDay: 'bad', govEnabled: false, testEnabled: false, docEnabled: false, intEnabled: false }
);

assertClose(warnings.estimate.baseTotal, 37, 'partial rates merge over defaults');
[
    'missing_custom_rate',
    'tier1_escalation_candidate',
    'requires_sap_availability_validation',
    'requires_integration_review',
    'hours_per_day_defaulted',
    'no_overhead_applied'
].forEach(code => {
    assert.ok(warnings.advisoryWarnings.some(w => w.code === code), `expected warning ${code}`);
});

console.log('SAP extensions calculator skill tests passed.');
