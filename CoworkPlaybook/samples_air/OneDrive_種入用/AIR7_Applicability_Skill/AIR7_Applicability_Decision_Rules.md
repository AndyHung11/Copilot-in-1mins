# Service Bulletin Applicability Decision Rules

> Document owner: Engineering · Technical Services　|　ZV-ENG-P-0531　|　Revision 3.1

## 1. What these rules fix in place

They turn the applicability test in section 2 of AIR5_Engineering_Order_Writing_Standard.md into a sequence that is
**followed in the same order every time**, so the answer does not vary with who is
doing it or how much time they have.

## 2. Decision sequence — order is fixed

```
Step 1  Check the modification kit embodiment record.
        Embodied -> Not applicable (stop)
Step 2  Check the part number and serial number of the installed component.
        Serial number missing -> Manual review required (stop)
Step 3  Is the installed component serial within the affected serial range?
        Yes -> Applicable
        No  -> Not applicable
```

⚠️ **The MSN does not appear anywhere in this sequence.** It is used for cross-
reference and record only, never as the basis of a step.

## 3. The three verdicts

| Verdict | Meaning |
|---|---|
| Applicable | Raise an EO and add the tail to the work list |
| Not applicable | Record the reasoning for audit; no EO |
| **Manual review required** | The data is insufficient to decide. Return it to a human. **Do not infer.** |

## 4. Why the third verdict has to exist

Where a component change record carries the part number but not the serial number,
the part number appears to match and the item is easily called applicable. But the
serial of that particular unit may well fall outside the affected range.

Either inference can be wrong, and the two errors are not equivalent:

- Wrongly called applicable → wasted man-hours, but the aircraft remains airworthy
- **Wrongly called not applicable → required work not done; once overdue the
  aircraft is not airworthy**

When data is missing, the only safe output is "manual review required".

## 5. Records to retain

For every tail: registration, MSN, modification status, installed component part and
serial number, verdict, reasoning, and date of assessment.

**A verdict recorded without its reasoning counts as no verdict at all.**
