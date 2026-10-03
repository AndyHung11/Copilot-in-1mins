# Fleet Reliability Programme Summary

> Document owner: Engineering · Technical Services　|　ZV-ENG-R-0601　|　Revision 3.1

## 1. Primary indicators

| Indicator | Definition | Alert level |
|---|---|---|
| Technical delay rate | Sectors delayed for technical reasons in the month / total sectors in the month | 1.5% |
| Repeat defect | same aircraft, same ATA chapter, three or more occurrences within 30 days | Case opened on meeting the definition |

## 2. Comparison basis — the part most often skipped

For a month-on-month figure to mean anything, **the fleet composition of the two
months must be the same**.

An aircraft in the hangar flies nothing: its sectors drop to zero and its delays
disappear with them. If that aircraft normally runs a delay rate above the fleet
average, **its absence alone improves the fleet average** — with no actual
reliability improvement behind it.

Monthly trends must therefore be reported as two sets of figures:

```
Headline     Whole-fleet delay rate for each of the two months
Like-for-like   Both months recalculated with any aircraft out of service excluded
```

⚠️ **Where the two sets point in opposite directions, the like-for-like figure
governs and the report must say so explicitly.** Publishing the headline figure
without disclosing the change in fleet composition is misleading.

## 3. A known limitation of the repeat-defect definition

The current definition is "same aircraft, same ATA chapter, three or more occurrences within 30 days". It is built **around the aircraft**, so it
catches an individual tail going wrong repeatedly but misses:

- Components from one lot fitted to different aircraft, each failing once. The count
  is the same, but one occurrence on each of three tails does not meet the
  definition.
- The same failure spread across three months, once a month.

Where failures in the same ATA chapter **cluster on one part number or lot across
tails**, raise them as a project item. The repeat-defect definition does not limit
this.

## 4. What the monthly report must answer

1. What are this month's figures, and how do they compare with last month?
2. **Did fleet composition change? What does the like-for-like comparison show?**
3. Does the repeat-defect list contain a part number or lot shared across tails?
4. Which department needs to do what?

## 5. Prohibited

- Do not publish headline figures alone in a month where fleet composition changed.
- Do not close out a cross-tail pattern simply because it fails the repeat-defect
  definition.
- Do not declare a trend improvement from a single month.
