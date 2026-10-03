# Check Slot Planning Guide (extract)

> Document owner: Engineering · Technical Services　|　ZV-ENG-P-0317　|　Revision 3.1

## 1. What constrains a slot

Choosing a check slot is not a matter of picking a quiet fortnight. For a slot to be
viable, **all** of the following must hold:

| Condition | Description | Where to look |
|---|---|---|
| Facility | The in-house hangar or the MRO is genuinely free for the whole period | "Resource availability" sheet in AIR3_Check_Slot_Options.xlsx |
| Airworthiness deadline | The **end date** of the slot must fall before the due date of every AD on that tail | AIR1_Airworthiness_Directive_Register.xlsx |
| Schedule impact | Cancellations are assessed by Operations and provided for comparison | "Slot options" sheet in AIR3_Check_Slot_Options.xlsx |
| Duration | Standard C check duration for this type is 14 days and may not be compressed | This guide |

⚠️ **Facility and deadline are pass/fail conditions; cancellations are merely better
or worse.** Eliminate the options that fail a hard condition first, then compare
cancellations among what is left. **Doing it the other way round will always pick
the wrong option.**

## 2. Bringing the AD deadline in

ADs falling due are worked off during the check, so it is the **end date** of the
slot that must precede the deadline, not the start date. A slot that ends one day
after the deadline grounds the aircraft on the deadline itself.

Where the AD is expressed in flight hours or cycles, convert it to an estimated due
date first, using AIR1_AD_Management_Procedure.md.

## 3. How facility blocking works

The in-house hangar takes one aircraft at a time. When reading "Resource
availability":

- **Any single day of overlap** between the block and the slot is a conflict. Do not
  compare start dates only.
- The MRO (Contoso Aero Services) keeps a separate slot book, and accepts no insertions while full.
- The aircraft holding the hangar may belong to a different fleet. Do not restrict
  the check to your own type.

## 4. Prohibited

- Do not compress the standard duration in order to save cancellations.
- Do not submit a slot to Operations before the facility is confirmed.
- Do not treat the airworthiness deadline as something to "try to make". It is a
  line that cannot be crossed.
