---
name: service-readiness-brief
description: Reads the daily service-readiness file, computes the agency-wide weighted average and per-location floor check, and flags persistent versus transient below-floor locations. Triggers when the user mentions service readiness, daily briefing, persistent or transient issues, or asks which location has a problem today. Requires the daily readiness file.
---

<!-- Reference answer: open this only after completing scenario 7 yourself. Yours doesn't need to look identical — what matters is computing both the weighted average and the per-location floor, and distinguishing persistent from transient issues. Keep this file out of OneDrive before the session, or scenario 7 becomes a copying exercise. -->

# GOV7 Custom Skill Reference Answer: service-readiness-brief

This is the reference answer for the exercise and **must not be placed in OneDrive before the session**, or learners will simply copy it instead of building the skill themselves.

The skill should:

1. Read the daily readiness file (xlsx) to get each location's readiness score.
2. Compute the agency-wide weighted average by population weight, and check it against the 90% threshold.
3. Check each location against the 85% floor and list any below it.
4. If a prior day's file is available for comparison, flag which locations are below the floor on consecutive days (persistent) versus only that day (transient).
5. When producing the briefing, <b>always show both the weighted average and the per-location list</b> — never report only the aggregate.
