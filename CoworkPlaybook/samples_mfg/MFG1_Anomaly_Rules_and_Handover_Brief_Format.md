# Anomaly Rules and Handover Brief Format (Training Sample)

> Input for a line supervisor to upload to Copilot Cowork so it can turn the night-shift log into a handover brief every morning using the same logic. These rules represent the user's own judgment standard — swap in your own line data and thresholds and the same approach still works.

## 1. Urgent-Item Rules
Any event meeting one of the following conditions must be listed under "Today's Urgent Items" and must never be omitted or downplayed:
1. A single stoppage lasting 30 minutes or more.
2. The same line experiencing 2 or more stoppages within 24 hours, regardless of how short each one was.
3. Any safety near-miss or safety event, regardless of how minor it seemed at the time.
4. A quality anomaly that causes an entire batch to be held pending disposition.

## 2. Watch-List Rules
The following are listed under "Ongoing Watch Items" — not urgent, but worth flagging:
- Material-shortage events.
- Mold-change or setup time exceeding the standard cycle.
- Anomaly signs noticed during inspection that have not yet actually affected output (e.g., unusual noise without a trip).

## 3. Fixed Handover Brief Format
1. **Today's Line Overview**: one-line status summary per production line.
2. **Top 3 Urgent Items**: selected per the rules above, each including line, time, impact, and current status.
3. **Ongoing Watch List**: non-urgent items the next shift should keep an eye on.
4. **Specific Notes for the Next Shift**: unfinished actions, or equipment/batches that still need observation.

## 4. Notes
- Downtime minutes and inspection descriptions must faithfully reflect the raw log; do not round or simplify to the point of being misleading.
- If the raw log contains contradictions or unclear entries, mark them "to be confirmed" in the brief — never assume or fill in gaps yourself.
- If the same piece of equipment recurs across multiple entries, the brief must explicitly state the cumulative count rather than listing each occurrence separately as if unrelated.
