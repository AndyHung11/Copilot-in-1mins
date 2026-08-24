# Line-Stop Severity and Response SOP

> This SOP is the decision basis for the event-driven task. When mail arrives, Cowork
> reads this document and classifies the event itself — nobody needs to grade it first.

## 1. Severity criteria

| Level | Criteria | Notify within | Notify |
|---|---|---|---|
| **P1 Critical** | Estimated stoppage ≥ 4 hours, or impacts a committed ship date, or involves personnel safety | 15 minutes | Plant manager, production manager, QA manager |
| **P2 Moderate** | Estimated stoppage 1–4 hours with no impact on committed ship dates | 1 hour | Production manager, shift supervisor |
| **P3 Minor** | Estimated stoppage < 1 hour, resolvable by the shift itself | Roll up before shift end | Shift supervisor |

### Escalation rules
- The **third stoppage on the same machine within 7 days** escalates to **P1**
  regardless of how short each one was
- An initial P2 that is not resolved within 2 hours **auto-escalates to P1**
- Anything involving personnel safety **may never be downgraded** — always P1

## 2. Every notification must include

1. Machine ID and line
2. Stoppage start time and current status
3. Assigned severity and the criterion it satisfies (state which rule)
4. Estimated time to recovery
5. Actions already taken
6. Support required

## 3. Notification formats

**Teams production channel (one line)**:
`[Level] Line-Machine | Down since HH:MM | ETA HH:MM | Current status`

**Reply to the reporter**:
Address all six items above, concise and free of speculation. Write "to be confirmed"
for unknowns rather than guessing.

> ⚠️ Every outbound message is drafted first and sent only after human approval.
