# Queue Time Control Standard

**Document**: QP-PRD-014　**Revision**: Rev.E　**Effective**: 2026-07-01

## 1 Purpose

Several station pairs in the assembly process are time-sensitive. Exceeding the limit
causes interface contamination, moisture uptake or oxidation, degrading downstream
quality. This standard defines the queue-time limits between stations and the action
required when they are exceeded.

## 2 Scope

Applies to all production and engineering lots. No lot is exempt on the basis of its type.

## 3 Limits between stations

| Station pair | Limit | Action when exceeded |
|---|---|---|
| Wire bond → Mold | 12 hours | Re-inspect wire bond appearance and record it |
| Mold → Post mold cure | 24 hours | Re-bake verification and raise an exception report |
| Post mold cure → Marking | 48 hours | Verify marking adhesion |
| Marking → Test | 72 hours | No additional action required |

## 4 How it is measured

Queue time runs from the **completion timestamp at the preceding station** to the
**start of work at the following station**. Time spent on hold **still counts** —
a hold does not stop the queue-time clock.

## 5 Action when exceeded

1. An over-limit lot may not simply be resumed. The action defined for that station
   pair must be completed first.
2. Where the overage exceeds 50% of the limit, QA shall additionally determine whether
   reliability testing is required.
3. Every exceedance requires an exception report, and the disposition record must be
   retained for customer audits.

## 6 Responsibilities

- Manufacturing: stop the lot on discovery and report it.
- Product Engineering: determine the disposition.
- Quality Assurance: verify the outcome and sign the release.
