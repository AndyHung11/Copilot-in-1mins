---
name: discount-floor-check
description: Check whether a channel discount exception holds the gross-margin floor and produce a
  verdict table. Trigger when the user mentions discount exceptions, margin floor, discount floor check,
  subsidies, or asks whether "channel X at Y% off" is compliant. Needs the channel pricing policy and,
  where applicable, the subsidy agreement.
---

<!-- Reference answer: open it after you have done the first two steps of scenario 7.
     Yours need not look identical. What matters is that the subsidy is checked against the
     agreement's scope first, margin is measured on net price, and the verdict states the gap.
     Do not put this file in OneDrive before the session, or scenario 7 turns into copying. -->

# Discount Floor Check

Apply these steps in order; do not reorder them:

1. Read the policy. Take the standard price, unit cost and margin floor from the channel pricing policy.
2. Check the subsidy agreement. Confirm item, channel, validity period and amount per unit.
   The subsidy counts only if all three scope tests match; otherwise the subsidy is 0.
3. Compute net price and margin.
   Net price = standard price x (1 - discount rate);
   gross margin = (net price - unit cost + subsidy) / net price. The denominator is net price.
4. Compare with the floor. Margin at or above the floor is "Compliant", otherwise "Breach"; state the gap in percentage points.

## Criteria

- The criterion is the margin, not the depth of the discount. A deep discount is not automatically a breach, and a shallow one is not automatically compliant.
- A subsidy counts only as written in the agreement; never apply it to a channel the agreement does not name.
- Add the subsidy to margin as an amount per unit; do not convert it into a discount rate.

## Guardrails

- If the agreement cannot be found or read, treat the subsidy as 0 and say so in the result.
- Do not assume cost, price or floor; if something is missing, say which item.
- Do not skip the working; show net price, subsidy and margin for every row.

## Output format

A table with: ID, channel, discount, net price, subsidy, margin, floor, gap, verdict.
After the table, one sentence on any breach and its cause.
If the user asks, write the results back into the Discount Exception Log.
