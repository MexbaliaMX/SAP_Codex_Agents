(function (root, factory) {
    if (typeof module === 'object' && module.exports) {
        module.exports = factory();
    } else {
        root.SapCalculatorCore = factory();
    }
}(typeof self !== 'undefined' ? self : this, function () {
    function cloneDeep(value) {
        return JSON.parse(JSON.stringify(value));
    }

    function toNonNegativeNumber(value, fallback = 0) {
        const parsed = Number(value);
        return Number.isFinite(parsed) ? Math.max(0, parsed) : fallback;
    }

    function toNonNegativeInteger(value, fallback = 0) {
        const parsed = Number(value);
        return Number.isFinite(parsed) ? Math.max(0, Math.floor(parsed)) : fallback;
    }

    function toPositiveNumber(value, fallback = 1) {
        const parsed = Number(value);
        return Number.isFinite(parsed) && parsed > 0 ? parsed : fallback;
    }

    function getStorageItem(storage, key) {
        try {
            return storage ? storage.getItem(key) : null;
        } catch (error) {
            return null;
        }
    }

    function setStorageItem(storage, key, value) {
        try {
            if (!storage) return false;
            storage.setItem(key, value);
            return true;
        } catch (error) {
            return false;
        }
    }

    function calculateWeightedTotals(items, complexityIds, counts, rates, groupKey) {
        const itemTotals = {};
        const groupTotals = {};
        let total = 0;

        items.forEach(item => {
            let itemTotal = 0;
            const itemCounts = counts[item.id] || {};
            const itemRates = rates[item.id] || {};

            complexityIds.forEach(complexityId => {
                const count = toNonNegativeInteger(itemCounts[complexityId]);
                const rate = toNonNegativeNumber(itemRates[complexityId]);
                itemTotal += count * rate;
            });

            itemTotals[item.id] = itemTotal;
            total += itemTotal;

            if (groupKey) {
                const groupId = item[groupKey];
                groupTotals[groupId] = (groupTotals[groupId] || 0) + itemTotal;
            }
        });

        return { itemTotals, groupTotals, total };
    }

    function calculateOverhead(baseTotal, overheadDefinitions) {
        const percentages = {};
        const hours = {};
        let totalPct = 0;
        let totalHours = 0;

        Object.keys(overheadDefinitions).forEach(key => {
            const definition = overheadDefinitions[key] || {};
            const pct = definition.enabled ? toNonNegativeNumber(definition.value) : 0;
            const value = baseTotal * (pct / 100);

            percentages[key] = pct;
            hours[key] = value;
            totalPct += pct;
            totalHours += value;
        });

        return { percentages, hours, totalPct, totalHours };
    }

    return {
        calculateOverhead,
        calculateWeightedTotals,
        cloneDeep,
        getStorageItem,
        setStorageItem,
        toNonNegativeInteger,
        toNonNegativeNumber,
        toPositiveNumber
    };
}));
