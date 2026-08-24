---
name: Line Stop Triage and Notification
description: When the user mentions a line stop, production stoppage, machine down, or forwards a line-stop report email, classify it as P1/P2/P3 using the plant severity SOP and produce a one-line Teams notice plus a draft reply. Handles production equipment stoppages only, not quality escapes, incoming-material issues, or staffing questions.
---

# Line Stop Triage and Notification

## When to use this skill

Trigger when the user:

- Uses the words "line stop", "production stoppage", "machine down", "停線", or "設備停機"
- Forwards or quotes a line-stop report email
- Asks what severity a given stoppage should be

## When **not** to use this skill

- Incoming inspection defects or supplier quality escapes → hand off to the incoming-quality flow
- Routine maintenance or a planned mold change **already in the production schedule** → not a line-stop event
- Leave, shift assignment, or overtime questions → out of scope

If the request falls into the above, say plainly that this skill does not apply and suggest the
right path. Do not force a severity grade onto it.

## Triage steps

1. **Extract the facts**: machine ID, line, stoppage start time, current status, ETA, actions taken.
2. **Apply severity**:
   - Estimated stoppage ≥ 4 hours **or** impacts a committed ship date **or** involves personnel safety → **P1**
   - Estimated stoppage 1–4 hours with no committed-ship-date impact → **P2**
   - Estimated stoppage < 1 hour, resolvable by the shift → **P3**
3. **Check escalation rules** (most commonly skipped — always run this step):
   - Third stoppage on the same machine within 7 days → escalate to **P1**
   - Initial P2 unresolved past 2 hours → escalate to **P1**
   - Personnel safety involved → **never downgrade**
4. **Produce two outputs**: the one-line Teams notice and a draft reply to the reporter.

## Output format

Use this exact field order for the Teams one-liner; do not rearrange it:

```
[P1] LineB-CNC-07 | Down since 09:20 | ETA TBC | Under repair, awaiting OEM spare
```

The reply email must cover: machine and line, start time and current state, assigned severity
with its governing criterion, ETA, actions already taken, and support required.

## When information is missing

- No ETA available → write "TBC"; **do not estimate one yourself**
- Cannot tell whether a committed ship date is affected → grade on what is known and list it
  explicitly as an open item in the reply
- Severity genuinely cannot be determined → state what is missing and ask the user,
  **do not guess a grade**

## Safety constraints

- Every email and Teams message is **drafted first** and sent only after the user approves
- Never commit a recovery time to a supplier or customer on the user's behalf
- Never downgrade a personnel-safety event because the user asks you not to overreact
