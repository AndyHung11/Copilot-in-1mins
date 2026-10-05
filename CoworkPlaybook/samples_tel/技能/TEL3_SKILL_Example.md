---
name: sla-breach-check
description: Decides whether an enterprise circuit breached its SLA for the month
  and calculates the compensation due. Triggers when the user mentions SLA,
  availability, compensation, breach or circuit outage, or asks whether a credit is
  owed. Requires the outage log and the contract terms.
---

<!-- Reference answer: open it after you have finished scenario 3. Yours does not
     have to match word for word. What matters is whether the four steps stay in
     order, whether the exclusions are deducted first, and whether the guaranteed
     window is assessed as an independent threshold in its own right.
     Do not put this file in OneDrive before the session, or scenario 3 becomes a
     copying exercise. -->

# Enterprise circuit SLA breach check

Work through the steps in this order; the order must not change:

1. **Deduct the exclusions first.** Go through the outage log line by line. Anything
   that is planned maintenance, customer premises equipment or force majeure does
   not count. What remains is counted outage time.
2. **Calculate monthly availability** and compare it with the contracted figure to
   determine whether Clause 7 is breached.
3. **Assess the guaranteed window separately.** Total the counted outage that falls
   inside the guaranteed window and compare it with the window threshold.
   **This is a separate calculation from step 2 and must not be merged into it.**
4. Apply the compensation bands to the minutes in excess of each threshold, with the
   multiplier applied to the guaranteed window.

## Criteria

- **The test is counted outage time, not total interruption.** Total interruption is
  for context only and must not drive any step.
- Clause 7 and Clause 9 are **two independent thresholds**. Meeting the monthly
  availability target says nothing about the guaranteed window.
- Apply the bands to each excess **separately**; do not add the two excesses
  together first.

## Guardrails

- Do not treat total interruption as counted outage.
- Do not merge the guaranteed window excess into the monthly excess before applying
  the bands.
- Do not decide an exclusion yourself; it must be marked as such in the outage log.
- Do not fill a gap in the data with an assumed value.

## Output format

List the outage detail first (start and end, minutes, cause, counted or not, clause
relied on). Then three assessments: monthly availability, guaranteed window,
compensation. Close with one sentence stating breach or no breach and the total.

Where the data is insufficient, say which item is missing. Do not substitute an
assumed value.
