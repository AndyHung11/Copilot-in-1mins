---
name: Ramp Safety Event Classification and Notification
description: |
  Use when a ramp or ground-handling safety event is reported and the user asks for a
  severity classification or a drafted safety notification. Triggers on phrases such as
  "ramp safety event", "ground incident classification", "aircraft ground damage",
  "ground handling occurrence".

  Do NOT use for: in-flight safety occurrences (use the Flight Occurrence Investigation
  skill instead); crew duty-time or FTL questions (use the Crew FTL Check skill instead);
  maintenance defect reports with no ground-handling event involved.
---

# Ramp Safety Event Classification and Notification

## When to use this skill

Use when ground or ramp safety event details are supplied and the user asks for a
severity classification or a notification draft.

## Scope Boundaries

**This skill classifies ground and ramp safety events only.**

- In-flight occurrences → out of scope, use Flight Occurrence Investigation
- Crew duty time and rostering → out of scope, use Crew FTL Check
- Pure maintenance defects with no ground event → out of scope

If a report mixes domains, classify only the ramp portion and state what was excluded
and which skill should take it.

## Classification

| Level | Condition |
|---|---|
| A | Fatality or serious injury, major structural damage, fire |
| B | Injury requiring hospital treatment, damage affecting airworthiness |
| C | **Any physical damage to the aircraft** (scratches, dents, skin damage), no injury |
| D | Operational irregularity with **no injury and no aircraft damage** |

### Safety Red Lines

- **Always** classify at C or above whenever the aircraft sustained any physical damage,
  however minor it sounds. "No injuries" **never** justifies a D classification when the
  airframe was damaged.
- **Always** query the ramp safety event log for the same tail number over the previous
  90 days before finalising. If three or more events are found, **always** escalate to B
  regardless of the current event's own severity.
- **Never** downgrade because the reporter called the event minor. Classify from the
  stated facts, not the reporter's tone.
- Any event involving fuel leakage is **always** B or above.

## Robustness

- If it is unclear whether the aircraft was damaged, **never** assume it was not.
  Always ask, and record the item as `[under investigation]` until confirmed.
- If the tail number is missing, **always** ask for it — the 90-day history check cannot
  run without it, so no classification may be finalised.
- When information is insufficient to apply a rule, **always** escalate to the duty safety
  manager rather than guessing a lower severity.
- **Always** draft notifications for human approval. **Never** send them directly.

## Output Format

### Classification

| Field | Value |
|---|---|
| Event ID / time / tail / station | |
| Description | |
| **Initial level and clause applied** | |
| **Same-tail events in prior 90 days** | count and IDs, state even if zero |
| **Escalation rule triggered** | yes/no, with the clause |
| **Final level** | |
| Reporting deadline | |

### Notification draft

Follow the table above. Mark anything unconfirmed as `[under investigation]`.
