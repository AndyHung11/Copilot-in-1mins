# Internal Project Notes (Raw) — Smart Command Center Rollout, Week 6

Note: this is the team's internal running log, for the weekly-report generator to clean up.

- Mon (2026/07/06): Set up API accounts with the client's IT. Their firewall config got stuck — took until late at night to get through. Their security folks being nitpicky again.
- Tue (2026/07/07): Data-cleaning script finished. Migrated historical data from 3 source systems into staging, ~2.4M rows, dropped about 8% duplicates.
- Wed (2026/07/08): Demoed v1 of the command-center dashboard to PM Chen. She's broadly OK with it but wants a "margin by region" view added.
- Thu (2026/07/09): Built the margin-by-region view; also optimized load time from 12s down to 3s.
- Fri (2026/07/10): Weekly sync with the client. CIO Lin asked about data residency — we confirmed everything is in the Taiwan Azure region and he's reassured. He wants a written compliance statement next week.
- Blocked: client-side SSO integration isn't scheduled yet, waiting on their AD team, likely the week of 2026/07/20.
- Budget: ~NT$1.2M spent so far, within the NT$3.0M budget.
- Next week: draft the compliance statement, start the predictive-analytics module, schedule SSO integration.
