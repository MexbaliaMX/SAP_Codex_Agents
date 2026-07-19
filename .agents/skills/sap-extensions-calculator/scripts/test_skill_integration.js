const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const skillRoot = path.resolve(__dirname, '..');
const skill = fs.readFileSync(path.join(skillRoot, 'SKILL.md'), 'utf8');
const routing = fs.readFileSync(path.join(skillRoot, 'references', 'related-skill-routing.md'), 'utf8');

[
    'sap-btp-cloud-platform',
    'sap-btp-connectivity',
    'sap-btp-integration-suite',
    'sap-abap-cds',
    'sapui5'
].forEach(skillName => {
    assert.ok(skill.includes(skillName), `SKILL.md should mention ${skillName}`);
    assert.ok(routing.includes(skillName), `related-skill-routing.md should mention ${skillName}`);
});

[
    'tier1_escalation_candidate',
    'requires_sap_availability_validation',
    'requires_integration_review',
    'large_scope_linear_model',
    'missing_custom_rate',
    'hours_per_day_defaulted',
    'no_overhead_applied'
].forEach(code => {
    assert.ok(routing.includes(code), `related-skill-routing.md should route ${code}`);
});

console.log('SAP extensions calculator related-skill integration test passed.');