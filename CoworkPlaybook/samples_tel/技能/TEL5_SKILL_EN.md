---
name: Enterprise Leased-Line SLA Credit Assessment
description: |
  Use when the user provides monthly enterprise leased-line outage data and asks to
  determine SLA breaches, calculate service credits, or draft customer compensation
  notices. Triggers on phrases such as "monthly SLA settlement", "leased line penalty",
  "service credit calculation", "SLA breach review".

  Do NOT use for: consumer broadband complaints (use the Consumer Complaint Response
  skill instead); personal data breach notifications (use the Data Breach Notification
  skill instead); general billing disputes with no enterprise SLA involved.
---

# Enterprise Leased-Line SLA Credit Assessment

## When to use this skill

Use when monthly enterprise leased-line outage data is supplied and the user asks
whether the SLA was breached, what service credit applies, or for a compensation
notice to the customer.

## Scope Boundaries

**This skill handles enterprise leased-line SLA only.**

- Consumer broadband or mobile complaints → out of scope, use the Consumer Complaint
  Response skill
- Personal data breach notification → out of scope, use the Data Breach Notification
  skill
- Billing disputes with no SLA element → out of scope

If a request mixes enterprise SLA with another topic, handle only the SLA portion and
state explicitly what was excluded and which skill should take it.

## Calculation rules

### Step 1 — derive actual outage hours

```
actual outage = total outage hours − announced planned maintenance hours
```

**Always subtract announced planned maintenance before applying any threshold.**
Never judge a breach from raw total outage hours alone.

### Step 2 — breach test

A breach exists if either holds:
- actual outage >= 4 hours
- availability < 99.5% (availability = (720 − actual outage) / 720)

### Step 3 — credit rate (driven by actual outage hours)

| Actual outage | Credit |
|---|---|
| 4h to under 8h | 5% of monthly fee |
| 8h to under 24h | 15% of monthly fee |
| 24h or more | 30% of monthly fee |

If the breach arises **only** from availability below 99.5% while outage is under 4h,
the rate is 5%. When both conditions hold, **never** stack them.

## Output Format

Produce one assessment table first, then one draft notice per customer.

### Assessment table

| Customer | Circuit | Total outage | Planned | Actual | Availability | Verdict | Credit |

### Each draft notice must contain

1. Customer name and circuit ID
2. Actual outage hours, **stating the planned-maintenance hours deducted**
3. Availability
4. The condition and rate applied
5. Credit amount and how it is applied to next month's invoice
6. Remediation summary

## Robustness

- If required data is missing, write `[to be confirmed]` and **never** invent a figure.
  Always ask rather than guess when outage hours or the monthly fee are absent.
- If planned-maintenance hours are absent, **do not assume zero** — state that the
  figure is unconfirmed and the result may change.
- **Always** draft compensation notices for human review. **Never** send them directly.
- Each customer gets a separate notice. **Never** merge customers into one email or
  copy one customer on another's notice.
- Because this skill commits the company to a monetary amount, **always** confirm each
  notice individually. **Never** request bulk approval for the whole batch.
