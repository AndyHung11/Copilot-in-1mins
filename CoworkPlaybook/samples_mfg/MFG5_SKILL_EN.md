---
name: weekly-output-report
description: Trigger when the user says "make my weekly output report", "weekly production report", or Chinese phrases such as "幫我做週產能報告"; reads raw per-line production data and produces a structured weekly report.
---

# weekly-output-report

## Purpose
Turn each production line's daily planned output, actual output, utilization rate, defect count and anomaly notes into a weekly production report suitable for a plant manager or operations lead.

## Required Sections
1. **Weekly Output Overview**: total planned output, total actual output, overall attainment rate, one-line conclusion.
2. **Per-Line Utilization and Yield**: list utilization and yield per line, and flag the best- and worst-performing lines this week.
3. **Anomaly Summary**: summarize anomalies that affected output this week (downtime, material shortages, quality issues, etc.), noting the line and degree of impact.
4. **Next-Week To-Dos / Risk Notes**: based on this week's anomalies, list items the next week should watch for or prepare ahead of time.

## Guardrails
- Never fabricate any output, utilization, or yield figures; all numbers must come from the input data.
- If yield or utilization falls below the target noted in the data, the report must explicitly flag it as "below target" and must not soften the finding.
- Output loss from material shortages or downtime must specify the affected line and an approximate magnitude, not a vague statement.
- Cross-line comparisons (e.g., "best/worst") must be based on the actual data, not impression.
- If input data is missing or contradictory, mark it "not provided in source data" or "to be confirmed" — never fill in the gap yourself.
