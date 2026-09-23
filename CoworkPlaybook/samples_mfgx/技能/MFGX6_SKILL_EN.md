---
name: sample-release-check
description: Decides whether engineering sample shipment requests can be released.
  Use when the user says "check these samples for release", "can these samples ship",
  "review the shipment requests", or uploads a sample shipment request file. Checks the
  deviation list for customer approval and validity period, and checks the engineering
  sample quantity cap and packaging marking.
---

<!-- Reference answer: open this after you have finished scenario 6. Yours does not
     need to look identical — what matters is whether all five criteria are in it, and
     whether the two deviation conditions are checked separately.
     The comment sits below the frontmatter on purpose — YAML frontmatter has to be on
     the very first line, so anything above it (comments included) breaks it. -->

# Engineering Sample Release Check

## When to use

When the user needs a release decision on one or more engineering sample shipment
requests. They will usually attach a sample shipment request file (CSV or Excel).

## Required material

1. The sample shipment request file the user provides.
2. The engineering sample release criteria and the specification deviation list, both
   under `Cowork_Lab/AdvancedPackaging/MFGX6_Sample_Release/` in OneDrive.

If either is missing, say so. Do not assume the criteria.

## Assessment steps

Process each request in turn:

1. **Read the qualification status**
   - "Qualified" → go to step 2.
   - "In qualification" → check whether the quantity exceeds the cap of **50
     units**, and confirm that both the carton and each individual package carry
     `ENGINEERING SAMPLE — NOT FOR PRODUCTION`.

2. **Check the specification deviation**
   Where the request carries a deviation number, look it up in the deviation list and
   **verify the two conditions separately**:
   - Is there a customer approval date?
   - Is the validity end date still in the future, against today's date?

   ⚠️ A requester note saying "customer approval obtained" is **not sufficient** —
   the validity end date must actually be checked. Failing either condition blocks
   release.

3. **NPI first shipments**
   Where qualification is in progress and the request is marked as an NPI first
   shipment, confirm that a first article inspection (FAI) report is attached.

4. **Give a verdict**: release, do not release, or release with conditions.

## Output format

One row per request, four fixed columns:

| Request | Verdict | Criterion applied | Required before release |
|---|---|---|---|

- "Criterion applied" must name which numbered criterion was used.
- "Required before release" is "none" where the request is released outright.
- Close with a one-line summary: how many released, blocked, and conditional.

## What not to do

- Do not request a deviation extension from the customer on the user's behalf.
- Do not modify the original request file.
- Where a criterion is ambiguous, say what is ambiguous rather than guessing and
  ruling anyway.
