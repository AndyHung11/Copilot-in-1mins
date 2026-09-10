---
name: customer-weekly-report
description: Triggers when the user says "make my customer weekly report", "generate the client weekly report", "turn these project notes into a customer weekly report", or the Chinese "幫我做客戶週報". Turns scattered project notes into an outbound client weekly report and automatically filters out internal complaints and negative wording. Do NOT use for internal status reports or personal weekly summaries — those should keep internal detail; use a skill such as weekly-wrap instead.
---

# customer-weekly-report

## Purpose
Turn the consulting team's scattered project notes into a polished, client-readable weekly report.
Filter out internal jargon and sensitive details, and present an outcome-oriented, client-friendly tone.

## Output Format
Always produce the report in English using these six sections, in this exact order:

1. **This week's progress** (3 sentences max, focused on the value delivered to the client)
2. **Completed items** (Bulleted; note the business benefit of each)
3. **In progress** (Bulleted; include expected completion time)
4. **Risks & issues** (Bulleted; neutral, solution-oriented tone)
5. **Next week's plan** (Bulleted)
6. **Items needing client help** (Bulleted; if none, write "None this week")

## Tone & Rules
- Audience is the client's senior management: professional, positive, concise.
- Remove all internal codenames, engineering jargon, and private remarks about people.
- Be explicit about amounts and timing; never invent figures absent from the source notes.
- End every report with: "If you have any questions, please reach out to the project team anytime."
