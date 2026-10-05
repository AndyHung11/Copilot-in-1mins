> Post to the Teams channel "Network Operations". Plain text list, no HTML markup.

**Overnight operations notice — 2026-11-16**

Two things running in parallel in the Taipei metro area tonight:

1. Contoso transport firmware upgrade, phase 2, finished yesterday. This week is the
   observation period.
2. Known mains instability in Xinyi and Da'an this week; the utility has scheduled
   repairs.

If you see batched alarms, check the topology register first to see whether one
parent node took them all down, **then** decide who to dispatch. Do not open a
ticket per line of the alarm list.

The triage procedure is in the TEL1 folder in OneDrive: Alarm Triage and Root Cause Procedure (extract)

—— Chen-Peng Kao, Network Engineering
