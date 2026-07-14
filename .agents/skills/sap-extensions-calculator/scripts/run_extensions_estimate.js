#!/usr/bin/env node

const fs = require('node:fs');
const {
    DEFAULT_EXTENSION_EFFORT_RATES,
    calculateExtensionsEstimate
} = require('./extensions_calculator');

function readInput(inputPath) {
    if (inputPath && inputPath !== '-') {
        return fs.readFileSync(inputPath, 'utf8');
    }
    return fs.readFileSync(0, 'utf8');
}

function main() {
    const inputPath = process.argv[2];
    const raw = readInput(inputPath);
    const payload = raw.trim() ? JSON.parse(raw) : {};
    const result = calculateExtensionsEstimate(
        payload.counts || {},
        payload.rates || DEFAULT_EXTENSION_EFFORT_RATES,
        payload.params || {}
    );

    process.stdout.write(JSON.stringify({
        estimate: result.estimate,
        advisoryWarnings: result.advisoryWarnings
    }, null, 2));
    process.stdout.write('\n');
}

if (require.main === module) {
    main();
}
