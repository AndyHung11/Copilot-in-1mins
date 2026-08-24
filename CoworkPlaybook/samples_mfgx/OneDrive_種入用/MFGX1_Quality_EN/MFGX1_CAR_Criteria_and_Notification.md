# Incoming-Quality CAR Criteria and Notification Targets

> This is the QA department's decision baseline. Cowork reads this file and applies
> the rules directly — nobody needs to pre-select the qualifying lots first.

## 1. When a CAR (Corrective Action Request) must be issued

Issue a CAR if **any one** of the following is true — they do not all need to hold:

1. **A single lot exceeds a 3.0% defect rate**
2. **The same supplier and part number exceeds 1.5% on two consecutive lots**
   (requires comparing dates across lots, not reading a single row)
3. **The defect involves a safety or regulatory requirement** (for example, coating
   thickness below the regulatory minimum, or a non-conforming material certificate) —
   **issue regardless of defect rate**

### When NOT to issue a CAR
- A single lot at or below 1.5% that is not a safety/regulatory defect
- Supplier correspondence that is merely a shipping notice, lead-time change, or quote
  update and is **unrelated to a quality problem**

> ⚠️ Note: a supplier proactively writing to explain a quality situation **does not by
> itself warrant a CAR**. Always decide from the three criteria above and the actual
> inspection data, never from the tone of the email.

## 2. Required fields on every CAR

| Field | Description |
|---|---|
| Supplier name | Use the legal name from the contract summary |
| Part No. / Name | The affected part |
| Trigger criterion | State explicitly whether criterion 1, 2, or 3 applies |
| Supporting lots | List every related lot number with its defect rate |
| Risk statement | Impact on the production line and delivery schedule |
| Response deadline | Derived from the penalty clause in the contract summary |

## 3. Notification targets

| Target | Channel | Focus |
|---|---|---|
| Procurement owner | Email | Full CAR content plus the contractual penalty clause |
| QA team | Teams channel post | One-line summary plus action items |
| Cross-functional review | Calendar meeting | 30 minutes, procurement and QA attending |

> Always pause for human approval before anything goes outbound; never send to the
> supplier automatically.
