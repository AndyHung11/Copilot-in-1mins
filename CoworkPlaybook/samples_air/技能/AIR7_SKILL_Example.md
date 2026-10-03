---
name: sb-applicability-check
description: Decides which aircraft in the fleet a service bulletin applies to.
  Triggers when the user mentions a service bulletin, SB, applicability or
  effectivity, or asks which tails need the work. Requires the bulletin's effectivity
  conditions and the fleet configuration record.
---

<!-- Reference answer: open this after you finish scenario 7 and compare. Yours does
     not have to read identically. What matters is whether the three steps stay in
     order, whether the MSN is kept out of the decision, and whether the third
     verdict - manual review required - is there.
     Do not put this file in OneDrive before the session, or scenario 7 becomes a
     copying exercise. -->

# Service Bulletin Applicability Check

Assess every aircraft in the following order. The order is fixed.

1. Check the modification kit embodiment record. If embodied, return "not
   applicable" and stop.
2. Check the part number and serial number of the installed component. **If the
   serial number is missing, return "manual review required" and stop.**
3. If the installed component serial falls within the bulletin's affected serial
   range, return "applicable"; otherwise return "not applicable".

## Decision basis

- **The basis is the installed component serial number, not the MSN.** The MSN is
  for cross-reference and record only and must not drive any step.
- An aircraft whose MSN is outside the range is still applicable if the installed
  component serial is inside it.
- An aircraft whose MSN is inside the range is not applicable if the modification
  kit has been embodied.

## Guardrails

- An MSN outside the SB range is not grounds for 'not applicable' — the installed component serial number must still be checked
- When a component change record has no serial number, always return 'manual review required' — never infer
- Both the modification-kit status and the component serial number must be checked — neither alone is sufficient
- The skill returns an applicability verdict only — it must not set compliance dates or schedule the work

## Output format

One row per aircraft with these columns in order: registration, MSN, modification
status, installed component part number, installed component serial, verdict,
reasoning. Finish with a count of each verdict.

Where the data is insufficient, put "manual review required" in the verdict column
and state which item of data is missing in the reasoning column.
