---
name: client-monthly-report
description: Trigger when the user says "make my client monthly report", "client monthly report", "email version", or Chinese phrases such as "幫我做客戶月報"; can output either a standalone HTML visual report or an Outlook-ready HTML email.
---

# client-monthly-report

## Purpose
Turn a relationship manager's contact log, holdings changes, and rebalancing discussion into a client-ready wealth-management monthly report. The output must be professional, clear, compliance-safe, and grounded in the provided figures.

## Output Mode Decision
- If the user says "email version", "Outlook email", "email 版", or "version to send to the client": output responsive, inline-styled HTML email suitable for Outlook.
- Otherwise: output a standalone visual HTML report with a clear title, card sections, tables, and simple visual hierarchy.

## Required Sections
1. **Monthly Summary**: 3–5 bullets focused on client goals, asset changes, and key watch items.
2. **Asset Allocation and Changes**: show buys, sells, maturities, cash level, and allocation differences.
3. **Performance Review**: use only period returns or valuation changes provided in the input; if absent, state "not provided in source notes".
4. **Market View**: neutrally connect the month's market backdrop to the client's allocation; do not overstate.
5. **Next-Month Suggestions**: list rebalancing, risk-control, or monitoring items for discussion; do not phrase as certain instructions.
6. **Compliance Disclaimer**: include investment-risk and no-guaranteed-return language.

## Guardrails
- Never use guaranteed-return language such as guaranteed yield, sure gain, risk-free, or certain upside.
- Never fabricate holdings, amounts, performance, or preferences; mark missing items as to be confirmed.
- Mask account numbers, government IDs, full birth dates, and phone numbers, e.g., ***-***-7890.
- Filter out internal notes, sales targets, fee complaints, private remarks, and anything not client-facing.
- Phrase recommendations as "may consider", "suggest discussing", or "subject to risk-profile confirmation".
- End with: This report is for informational purposes only and is not investment advice or solicitation; investing involves risk, and past performance does not indicate future results.
