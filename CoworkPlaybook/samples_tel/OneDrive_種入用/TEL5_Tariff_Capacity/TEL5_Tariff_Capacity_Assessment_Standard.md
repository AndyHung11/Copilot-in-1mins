# Tariff Capacity Assessment Standard (extract)

> Document owner: Network Engineering　|　ZVT-MKT-P-0418　|　Revision 2.4

## 1. Average usage is not a sufficient basis for capacity assessment

The "expected average usage" supplied by marketing is the **arithmetic mean across
all subscribers**. Mobile data usage is **heavily skewed**: the top 5% of users
typically account for more than thirty per cent of total traffic.

Multiplying the mean by the expected subscriber count produces a number that looks
**comfortably safe at network level**. But networks do not congest at the network
average — they congest in **particular areas at particular hours**.

## 2. Assess at two levels

```
Level 1  Network:  mean usage x expected subscribers   -> compare with network busy-hour headroom
Level 2  Regional: P95 usage  x regional subscribers   -> compare with that region's busy-hour headroom
```

⚠️ **Passing level 1 says nothing about level 2.** Almost every launch problem
　 appears at level 2.

## 3. Identifying hotspot regions

| Test | Threshold |
|---|---|
| Share of heavy users (top 5%) | Above **8.0%** marks a hotspot region |
| Busy-hour headroom | Below **15%** is insufficient to absorb the increase |

Regions meeting **both** tests are subject to a capacity upgrade as a precondition;
the tariff must not be sold in those regions until the upgrade is complete.

## 4. What the presentation must contain

When presenting to the decision forum, **network-level figures alone are not
acceptable**. Include:

1. Network-level assessment (level 1)
2. **Regional hotspot list** (level 2), showing heavy-user share and busy-hour
   headroom for each hotspot
3. Upgrade requirement, lead time and cost
4. Expected service quality impact if the tariff launches without the upgrade
5. Recommendation (launch everywhere / defer hotspots / phased launch)

## 5. Prohibited

- Do not approve a tariff on an average-usage assessment alone.
- Do not sell in a hotspot region before its upgrade is complete.
- Do not omit the regional assessment from the presentation.
