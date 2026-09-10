# S5 Trigger Test Email (for step 4)

> **Purpose**: verify the event-driven task actually fires.
> **How**: send the subject and body below **to yourself** from your own mailbox,
> then give Cowork no instructions at all and watch it act on its own.

---

## Subject (copy exactly — the keyword "weekly notes" must be present)

```
Weekly notes — Smart Operations Centre rollout, week 7
```

## Body (copy as-is, or swap in your own notes)

```
- Mon (2026-07-13): First draft of the compliance write-up done; legal reviewed it and wants a
  section added on data retention periods.
- Tue (2026-07-14): Started the predictive analytics module with a requirements pass. What the
  client wants doesn't quite match the original SOW — we need a call to pin down scope.
- Wed (2026-07-15): SSO integration finally scheduled; their AD team confirmed the week of 7/22.
  Two weeks of waiting, at last some movement.
- Thu (2026-07-16): First real-traffic test since the dashboard went live. 180 concurrent users
  at peak with no issues; response time stayed under 3 seconds.
- Fri (2026-07-17): Weekly sync. PM Chen says her director wants a cross-month trend view. That
  was never in scope — I said we'd assess it.
- Blocked: the scope gap on predictive analytics. Needs a meeting next week or we build the
  wrong thing.
- Budget: about TWD 1.65M spent to date, still within budget.
- Next week: finalise the compliance doc, hold the scope meeting, prepare for SSO integration.
```

---

## Why use this instead of re-pasting the week 6 notes

You already used the week 6 notes in step 3. If the trigger test reuses them, you
**cannot tell whether the report is left over from that run or genuinely new**.
Different content means seeing "week 7" proves it really ran again.

## What is deliberately planted here

| Planted | Purpose |
|---------|---------|
| "Two weeks of waiting, at last some movement" | Internal gripe — **must not appear** in the client-facing report |
| "or we build the wrong thing" | Same: negative tone |
| The scope gap | Should land under "Risks & issues" |
| Director wants a cross-month view | Should land under "Items needing client help" or risks |
| Budget TWD 1.65M of 3M | The figure must carry through correctly |

When the report arrives on its own, check it against this table — that matters more
than simply confirming that it ran.

## ⚠️ When you are done

Go to the <b>Automations</b> page and set this event-driven task to **paused**,
or any future email with "weekly notes" in the subject will fire it.
