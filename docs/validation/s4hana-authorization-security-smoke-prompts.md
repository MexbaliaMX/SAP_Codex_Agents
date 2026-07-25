# SAP S/4HANA Authorization Security Smoke Prompts

Use these prompts to regression-test `sap-s4hana-authorization-security` after updates. They are local reasoning checks using sanitized scenarios, not live SAP tenant validation.

## Acceptance Criteria

- Use evidence-bound language and do not claim tenant proof.
- Separate confirmed facts, assumptions, evidence gaps, risks, recommendations, owners, and approval gates where relevant.
- Do not request or expose credentials, tokens, private keys, or sensitive personal data.
- Do not recommend blindly adding all objects from SU53 or trace output.
- Keep production-impacting role, catalog, service, DCL, user, trust, and transport changes approval-gated.
- Use SAP S/4HANA process language first and flag Mexico fiscal/audit overlays when relevant.

## Prompt 1: Record-to-Report Authorization Readiness

Use `$sap-s4hana-authorization-security` to prepare a client-safe SAP S/4HANA authorization readiness review from this sanitized scenario. Do not edit files.

Scenario: QA testing for Record-to-Report found that persona `MX-R2R-AP-ANALYST` can display vendor master data and run invoice display tasks as expected, but also appears able to change payment block values. Evidence available: role list `Z_MX_R2R_AP_ANALYST`, generated profile status confirmed in QA, user assignment matrix for aliases `USR_AP01` and `USR_AP_NEG`, SU53 screenshot for a denied negative test on company code 2000, role owner notes saying only company code 1000 should be allowed. Missing evidence: authorization object summary export, full org-level values, transport request, and security owner signoff.

Produce the advisory output in executive Spanish with confirmed facts, assumptions, evidence gaps, risks, recommendations, and next actions.

## Prompt 2: Procure-to-Pay Fiori Access Matrix

Use `$sap-s4hana-authorization-security` to prepare a SAP Fiori access traceability matrix from this sanitized scenario. Do not edit files.

Scenario: Procure-to-Pay UAT users report that app `F0842A Manage Purchase Orders (Version 2)` is visible for `BUYER_QA_01`, but `BUYER_QA_NEG` should not see it and currently does. Evidence available: business role candidate `Purchaser`, business catalog candidate `SAP_PRC_BC_PURCHASER_PO`, space/page screenshot from QA, launchpad tile screenshot for both aliases, and a note that backend role assignment may have been copied from an older composite role. Missing evidence: target mapping export, OData/service check, backend authorization object summary, negative authorization trace, and transport owner approval.

Produce the matrix and concise findings with evidence gaps, risks, recommendations, and approval gates.

## Prompt 3: CDS/DCL Security Review

Use `$sap-s4hana-authorization-security` to prepare a CDS/DCL security review from this sanitized scenario. Do not edit files.

Scenario: A custom CDS view entity `ZC_MX_CASHFLOW_OVERVIEW` is exposed to a Fiori analytical app for Treasury in QA. The developer notes show `@AccessControl.authorizationCheck: #CHECK`, but no DCL source has been provided. The intended restriction is company code-level display only for Record-to-Report treasury users, with company code 1000 allowed and company code 2000 denied. Evidence available: CDS name, app purpose, target persona `MX-R2R-TREASURY-ANALYST`, positive test screenshot for company code 1000. Missing evidence: DCL role source, `pfcg_auth` mapping, OData/service binding details, negative test for company code 2000, target release, and transport request.

Produce a technical advisory review with findings, release assumptions, evidence gaps, recommended validation steps, and approval gates.

## Prompt 4: Record-to-Report SoD Control Review

Use `$sap-s4hana-authorization-security` and the `.agents/subagents/sap-sod-controls-advisor.md` role playbook to prepare a SoD/control review from this sanitized scenario. Do not edit files.

Scenario: In QA, role `Z_MX_R2R_AP_ANALYST` is assigned to alias `USR_AP01`. UAT evidence suggests the persona can display vendor master data, display invoices, and change payment block values in company code 1000. The role owner says the persona should be display-only. Missing evidence: authorization object summary, org-level export, change document evidence, compensating control owner, and exception approval.

Produce a SoD control matrix with confirmed facts, assumptions, risks, compensating controls, evidence gaps, owner actions, and approval gates.

## Prompt 5: Procure-to-Pay Cross-Process SoD Review

Use `$sap-s4hana-authorization-security` and the `.agents/subagents/sap-sod-controls-advisor.md` role playbook to review a Procure-to-Pay SoD scenario. Do not edit files.

Scenario: Alias `BUYER_QA_02` appears to have access to create purchase orders, post goods receipt, release blocked invoices, and view supplier payment status. Evidence available: role assignment matrix, Fiori tile screenshots, and workshop notes from the Procure-to-Pay owner. Missing evidence: backend object summary, SAP GUI fallback exposure, negative tests, approval workflow evidence, and control owner signoff.

Produce an advisory SoD review with sensitive access risks, Mexico fiscal/audit cues, compensating control options, validation steps, and gates before any transport.

## Prompt 6: File-Based Fiori Evidence Review

Use `$sap-s4hana-authorization-security` to review `.agents/samples/deliverables/sample-s4hana-fiori-access-matrix.csv`. First run `.agents/skills/sap-s4hana-authorization-security/scripts/validate_authorization_evidence.py --profile fiori-access` against the CSV. Then summarize validation issues, evidence gaps, risks, recommendations, owners, and approval gates. Do not edit files.

## Prompt 7: File-Based SoD Evidence Review

Use `$sap-s4hana-authorization-security` and `.agents/subagents/sap-sod-controls-advisor.md` to review `.agents/samples/deliverables/sample-sap-sod-control-matrix.csv`. First run `.agents/skills/sap-s4hana-authorization-security/scripts/validate_authorization_evidence.py --profile sod-control` against the CSV. Then produce a concise SoD advisory review with control gaps, Mexico fiscal/audit cues, validation steps, and approval gates. Do not edit files.

## Prompt 8: Generated Review Pack Regression

Use `$sap-s4hana-authorization-security` to generate review packs from the Fiori and SoD CSV samples with `.agents/skills/sap-s4hana-authorization-security/scripts/generate_authorization_review_pack.py`. Compare the generated Markdown to the matching `golden-*.md` sample outputs and summarize any behavioral drift before accepting changes.
