# Supplier Change and Discontinuation (PCN / EOL) Handling Standard

**Document**: QP-PUR-011　**Revision**: Rev.F　**Effective**: 2026-06-01

## 1 Deadline

An impact assessment shall be completed within **5 working days**
of receiving a supplier PCN or EOL notice, and issued to Purchasing and Product
Engineering.

## 2 Required content of the assessment

The assessment shall contain **at minimum** all of the following. An assessment
missing any item shall not be submitted.

1. Affected part number, last time buy date, last shipment date.
2. **BOM where-used expansion** — every device that uses the part, not merely those
   with current consumption history.
3. **Projected usage for devices not yet in production** — where the where-used list
   includes a device that has not started mass production, the assessment shall cite
   that device's ramp plan and include its projected post-MP usage.
   ⚠️ Deriving months of cover from historical consumption alone is treated as an
   incomplete assessment.
4. Months of inventory cover, stated for both the current usage and the combined
   post-MP usage scenarios.
5. Replacement part information and the time required to requalify it.
6. Recommended last time buy quantity and order deadline.

## 3 Last time buy calculation

    Last time buy = (requalification period + 2 months safety stock)
                    × projected monthly usage over that period
                    − projected inventory on hand at the last shipment date

"Projected monthly usage" shall be the combined usage **across all where-used devices**.

## 4 Risk grading

| Grade | Condition |
|---|---|
| High | Months of cover < requalification period, or last time buy date earlier than a new device's MP date |
| Medium | Months of cover < requalification period + safety stock |
| Low | Neither of the above |

High-risk cases shall be reported to the purchasing manager on the day the assessment
is completed.

## 5 Retention

Assessments and associated correspondence shall be retained until two years after the
part is fully phased out, for customer audit.
