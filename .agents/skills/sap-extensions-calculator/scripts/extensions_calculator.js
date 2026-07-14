(function (root, factory) {
    if (typeof module === 'object' && module.exports) {
        module.exports = factory(require('./calculator_core'));
    } else {
        root.SapExtensionsCalculator = factory(root.SapCalculatorCore);
    }
}(typeof self !== 'undefined' ? self : this, function (core) {
    const EXTENSION_COMPLEXITIES = [
        { id: 'muy-alta', label: 'Muy Alta', cls: 'muy-alta' },
        { id: 'alta', label: 'Alta', cls: 'alta' },
        { id: 'media', label: 'Media', cls: 'media' },
        { id: 'baja', label: 'Baja', cls: 'baja' }
    ];

    const EXTENSION_TIERS = [
        { id: 'tier1', label: 'Tier 1 — In-App (Key User)', pill: 'T1', pillClass: 'tier1' },
        { id: 'tier2', label: 'Tier 2 — Developer (RAP / ABAP Cloud)', pill: 'T2', pillClass: 'tier2' },
        { id: 'tier3', label: 'Tier 3 — Side-by-Side (BTP / CAP / Integración)', pill: 'T3', pillClass: 'tier3' }
    ];

    const EXTENSION_TYPES = [
        { id: 't1-custom-fields', tier: 'tier1', label: 'Custom Fields', description: 'Campos adicionales en objetos estándar (sin desarrollo tradicional).' },
        { id: 't1-custom-logic', tier: 'tier1', label: 'Custom Logic', description: 'Validaciones/derivaciones con ABAP restringido en apps de extensibilidad.' },
        { id: 't1-custom-cds', tier: 'tier1', label: 'Custom CDS / Queries', description: 'Vistas CDS y consultas analíticas para reporteo/embedded analytics.' },
        { id: 't1-ui-adapt', tier: 'tier1', label: 'UI Adaptation', description: 'Adaptaciones simples de UI (Fiori) sin lógica compleja.' },
        { id: 't2-rap-managed-bo', tier: 'tier2', label: 'RAP Managed BO', description: 'Nuevo objeto de negocio (CRUD) con persistencia propia + (opcional) Fiori Elements.' },
        { id: 't2-rap-unmanaged-wrapper', tier: 'tier2', label: 'RAP Unmanaged Wrapper', description: 'Wrapper sobre operación estándar vía APIs released; RAP agrega validaciones/acciones.' },
        { id: 't2-events', tier: 'tier2', label: 'Eventos / Handlers', description: 'Extensión event-driven (eventos RAP o triggers) con procesamiento asíncrono.' },
        { id: 't2-analytics-model', tier: 'tier2', label: 'Modelo Analítico (CDS)', description: 'Cubo/consulta CDS para analítica sin comportamiento transaccional.' },
        { id: 't3-cap-service', tier: 'tier3', label: 'CAP Service/API', description: 'Servicio CAP (Node/Java) consumiendo S/4HANA vía APIs released.' },
        { id: 't3-cap-app', tier: 'tier3', label: 'CAP App (UI + API)', description: 'Aplicación side-by-side con UI + API, autenticación y (posible) persistencia.' },
        { id: 't3-build-apps-ui', tier: 'tier3', label: 'SAP Build Apps (UI No-Code)', description: 'Aplicación móvil o web construida sin código (LCNC), consumiendo APIs de S/4HANA.' },
        { id: 't3-build-process-automation', tier: 'tier3', label: 'SAP Build Process Automation', description: 'Workflows y automatización de procesos (RPA + Workflow) en BTP (LCNC).' },
        { id: 't3-sac-dashboard', tier: 'tier3', label: 'SAC Dashboard / Story', description: 'Visualización analítica en SAP Analytics Cloud consumiendo Datasphere o S/4HANA (Live).' },
        { id: 't3-sac-planning', tier: 'tier3', label: 'SAC Planning Model', description: 'Modelo de planeación financiera/operativa con procesos de datos y lógica de predicción.' },
        { id: 't3-datasphere-model', tier: 'tier3', label: 'Datasphere Business Model', description: 'Modelado semántico (Business Entities/Facts) en Datasphere sobre datos federados.' },
        { id: 't3-datasphere-integration', tier: 'tier3', label: 'Datasphere Data Integration', description: 'Flujos de integración y replicación de datos de fuentes SAP y No-SAP (Data Fabric).' },
        { id: 't3-integration', tier: 'tier3', label: 'Integration Suite iFlow (A2A)', description: 'iFlow A2A (S/4HANA ↔ apps internas) con mapping, errores, reintentos y correlación.' },
        { id: 't3-iflow-b2b', tier: 'tier3', label: 'Integration Suite iFlow (B2B)', description: 'iFlow B2B (bancos, SAT, partners) con seguridad, acknowledgments y SLA.' },
        { id: 't3-api-management', tier: 'tier3', label: 'API Management (Policies)', description: 'Policies/productos: seguridad OAuth2, throttling, analytics, versionado, portal.' },
        { id: 't3-api-contract', tier: 'tier3', label: 'API Contract (OpenAPI)', description: 'Definición/gestión de contrato OpenAPI (recursos, schemas, errores, versionado).' },
        { id: 't3-event-mesh', tier: 'tier3', label: 'Event Mesh (Topic+Schema)', description: 'Diseño/alta de tópicos + esquema CloudEvents, DLQ y suscripciones.' },
        { id: 't3-connectivity', tier: 'tier3', label: 'Conectividad (Destinations)', description: 'Destinations/certificados/Trust, routing y pruebas de conectividad (S/4, PAC, POS).' },
        { id: 't3-open-connectors', tier: 'tier3', label: 'Open Connectors', description: 'Conectores a terceros, autenticación, mapeos y hardening operativo.' },
        { id: 't3-integration-testing', tier: 'tier3', label: 'Pruebas Integración (SIT)', description: 'Pruebas end-to-end + contract testing, datos de prueba y criterios de aceptación.' },
        { id: 't3-ops-monitoring', tier: 'tier3', label: 'Ops/Monitoreo (Runbook)', description: 'Observabilidad, alertas, DLQ, dashboards, runbooks e hiper-care go-live.' }
    ];

    const DEFAULT_EXTENSION_EFFORT_RATES = {
        't1-custom-fields': { 'muy-alta': 3, 'alta': 2, 'media': 1, 'baja': 0.5 },
        't1-custom-logic': { 'muy-alta': 24, 'alta': 16, 'media': 8, 'baja': 4 },
        't1-custom-cds': { 'muy-alta': 40, 'alta': 24, 'media': 12, 'baja': 6 },
        't1-ui-adapt': { 'muy-alta': 24, 'alta': 16, 'media': 8, 'baja': 4 },
        't2-rap-managed-bo': { 'muy-alta': 220, 'alta': 140, 'media': 80, 'baja': 40 },
        't2-rap-unmanaged-wrapper': { 'muy-alta': 180, 'alta': 120, 'media': 60, 'baja': 24 },
        't2-events': { 'muy-alta': 60, 'alta': 40, 'media': 24, 'baja': 12 },
        't2-analytics-model': { 'muy-alta': 90, 'alta': 60, 'media': 32, 'baja': 16 },
        't3-cap-service': { 'muy-alta': 220, 'alta': 140, 'media': 80, 'baja': 40 },
        't3-cap-app': { 'muy-alta': 400, 'alta': 260, 'media': 160, 'baja': 80 },
        't3-build-apps-ui': { 'muy-alta': 160, 'alta': 100, 'media': 60, 'baja': 32 },
        't3-build-process-automation': { 'muy-alta': 140, 'alta': 90, 'media': 54, 'baja': 24 },
        't3-sac-dashboard': { 'muy-alta': 120, 'alta': 80, 'media': 40, 'baja': 16 },
        't3-sac-planning': { 'muy-alta': 240, 'alta': 160, 'media': 100, 'baja': 40 },
        't3-datasphere-model': { 'muy-alta': 80, 'alta': 54, 'media': 32, 'baja': 12 },
        't3-datasphere-integration': { 'muy-alta': 100, 'alta': 70, 'media': 40, 'baja': 20 },
        't3-integration': { 'muy-alta': 140, 'alta': 90, 'media': 50, 'baja': 24 },
        't3-iflow-b2b': { 'muy-alta': 220, 'alta': 140, 'media': 80, 'baja': 40 },
        't3-api-management': { 'muy-alta': 60, 'alta': 40, 'media': 24, 'baja': 12 },
        't3-api-contract': { 'muy-alta': 40, 'alta': 24, 'media': 16, 'baja': 8 },
        't3-event-mesh': { 'muy-alta': 90, 'alta': 60, 'media': 32, 'baja': 16 },
        't3-connectivity': { 'muy-alta': 60, 'alta': 40, 'media': 24, 'baja': 12 },
        't3-open-connectors': { 'muy-alta': 90, 'alta': 60, 'media': 32, 'baja': 16 },
        't3-integration-testing': { 'muy-alta': 120, 'alta': 80, 'media': 50, 'baja': 24 },
        't3-ops-monitoring': { 'muy-alta': 80, 'alta': 60, 'media': 40, 'baja': 20 }
    };

    function cloneDefaultExtensionRates() {
        return core.cloneDeep(DEFAULT_EXTENSION_EFFORT_RATES);
    }

    function getDefaultOverheadParams() {
        return {
            govEnabled: false,
            govValue: 0,
            testEnabled: false,
            testValue: 0,
            docEnabled: false,
            docValue: 0,
            intEnabled: false,
            intValue: 0
        };
    }

    function mergeRatesWithDefaults(rates) {
        const merged = cloneDefaultExtensionRates();
        if (!rates) return merged;

        EXTENSION_TYPES.forEach(type => {
            if (!rates[type.id]) return;
            EXTENSION_COMPLEXITIES.forEach(complexity => {
                if (rates[type.id][complexity.id] !== undefined) {
                    merged[type.id][complexity.id] = rates[type.id][complexity.id];
                }
            });
        });

        return merged;
    }

    function buildAdvisoryWarnings(counts, rates, params, weighted, overhead, hoursPerDay) {
        const warnings = [];
        const activeCounts = counts || {};
        const providedRates = rates || {};
        const activeParams = params || {};

        if (rates) {
            EXTENSION_TYPES.forEach(type => {
                const itemCounts = activeCounts[type.id] || {};
                EXTENSION_COMPLEXITIES.forEach(complexity => {
                    const count = core.toNonNegativeInteger(itemCounts[complexity.id]);
                    if (count > 0 && (!providedRates[type.id] || providedRates[type.id][complexity.id] === undefined)) {
                        warnings.push({
                            code: 'missing_custom_rate',
                            severity: 'warning',
                            message: `Missing custom rate for ${type.label} / ${complexity.label}; default rate was used.`,
                            typeId: type.id,
                            complexityId: complexity.id
                        });
                    }
                });
            });
        }

        EXTENSION_TYPES.forEach(type => {
            const itemTotal = weighted.itemTotals[type.id] || 0;
            if (type.tier === 'tier1' && itemTotal > 20) {
                warnings.push({
                    code: 'tier1_escalation_candidate',
                    severity: 'review',
                    message: `${type.label} exceeds 20 hours in Tier 1; review whether Tier 2/RAP or another released extensibility option is more appropriate.`,
                    typeId: type.id,
                    tier: type.tier,
                    hours: itemTotal
                });
            }
        });

        const tier3Hours = weighted.groupTotals.tier3 || 0;
        if (tier3Hours > 0) {
            warnings.push({
                code: 'requires_sap_availability_validation',
                severity: 'review',
                message: 'Tier 3 scope includes BTP, integration, analytics, automation, or operations categories; validate tenant availability, licensing, released APIs, security, and roadmap before treating the estimate as committed scope.',
                tier: 'tier3',
                hours: tier3Hours
            });
        }

        const integrationTypeIds = [
            't3-integration',
            't3-iflow-b2b',
            't3-api-management',
            't3-api-contract',
            't3-event-mesh',
            't3-connectivity',
            't3-open-connectors',
            't3-integration-testing',
            't3-ops-monitoring'
        ];
        const integrationHours = integrationTypeIds.reduce((sum, typeId) => sum + (weighted.itemTotals[typeId] || 0), 0);
        if (integrationHours > 0) {
            warnings.push({
                code: 'requires_integration_review',
                severity: 'review',
                message: 'Integration-heavy scope should be reviewed for authentication, monitoring, retries, error handling, contract testing, auditability, and operational ownership.',
                hours: integrationHours
            });
        }

        if (!activeParams.hoursPerDay || hoursPerDay !== Number(activeParams.hoursPerDay)) {
            warnings.push({
                code: 'hours_per_day_defaulted',
                severity: 'info',
                message: `Invalid or missing hoursPerDay; using ${hoursPerDay} hours/day.`,
                value: hoursPerDay
            });
        }

        if (overhead.totalPct === 0 && weighted.total > 0) {
            warnings.push({
                code: 'no_overhead_applied',
                severity: 'info',
                message: 'No governance, testing, documentation, or integration overhead was applied; confirm this is intentional for advisory or client-facing estimates.'
            });
        }

        const totalObjects = EXTENSION_TYPES.reduce((sum, type) => {
            const itemCounts = activeCounts[type.id] || {};
            return sum + EXTENSION_COMPLEXITIES.reduce((innerSum, complexity) => {
                return innerSum + core.toNonNegativeInteger(itemCounts[complexity.id]);
            }, 0);
        }, 0);

        if (totalObjects > 50) {
            warnings.push({
                code: 'large_scope_linear_model',
                severity: 'review',
                message: 'Large object counts can make the linear model overconfident; review shared setup, reuse, dependency chains, regression testing, release governance, and cutover constraints.',
                objectCount: totalObjects
            });
        }

        return warnings;
    }

    function calculateExtensionsEstimate(counts, rates, params) {
        const activeRates = mergeRatesWithDefaults(rates);
        const activeParams = Object.assign(getDefaultOverheadParams(), params || {});
        const complexityIds = EXTENSION_COMPLEXITIES.map(c => c.id);
        const weighted = core.calculateWeightedTotals(
            EXTENSION_TYPES,
            complexityIds,
            counts || {},
            activeRates,
            'tier'
        );
        const overhead = core.calculateOverhead(weighted.total, {
            gov: { enabled: activeParams.govEnabled, value: activeParams.govValue },
            test: { enabled: activeParams.testEnabled, value: activeParams.testValue },
            doc: { enabled: activeParams.docEnabled, value: activeParams.docValue },
            int: { enabled: activeParams.intEnabled, value: activeParams.intValue }
        });
        const hoursPerDay = core.toPositiveNumber(activeParams.hoursPerDay, 8);
        const totalHours = weighted.total + overhead.totalHours;
        const estimate = {
            baseTotal: weighted.total,
            hoursPerDay,
            overheadHours: overhead.hours,
            overheadPercentages: overhead.percentages,
            totalDays: totalHours / hoursPerDay,
            totalHours,
            totalOverhead: overhead.totalHours,
            totalOverheadPct: overhead.totalPct,
            typeTotals: weighted.itemTotals,
            tierTotals: weighted.groupTotals
        };
        const advisoryWarnings = buildAdvisoryWarnings(counts, rates, activeParams, weighted, overhead, hoursPerDay);

        return Object.assign({}, estimate, {
            advisoryWarnings,
            estimate
        });
    }

    return {
        DEFAULT_EXTENSION_EFFORT_RATES,
        EXTENSION_COMPLEXITIES,
        EXTENSION_TIERS,
        EXTENSION_TYPES,
        calculateExtensionsEstimate,
        cloneDefaultExtensionRates,
        mergeRatesWithDefaults
    };
}));
