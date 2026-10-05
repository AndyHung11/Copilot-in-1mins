# Maintenance Window Planning Guide (extract)

> Document owner: Network Engineering　|　ZVT-NET-P-0207　|　Revision 2.4

## 1. A window must satisfy three conditions at once

| Condition | Threshold | Where to look |
|---|---|---|
| Noise restriction | In residential zones, noise-generating work between 22:00 and 07:00 must not exceed 30 minutes | This guide |
| Enterprise batch traffic | Batch volume in the window must not exceed 5.0 TB | "Options" sheet in TEL2_Maintenance_Window_Options.xlsx |
| Consumer impact | No more than 20,000 subscribers affected (above that, department head approval is required) | Same sheet |

⚠️ **All three are pass/fail.** This is not a weighted score: an unusually low
consumer impact does not buy you an unusually high batch volume.

## 2. Why the small hours are not the answer

Instinct picks the overnight window because consumer numbers are lowest. But the
two customer bases peak at **opposite ends of the clock**:

```
Consumer peak          19:00 – 23:00 (streaming, social)
Enterprise batch peak  00:00 – 05:00 (replication, backup, settlement)
```

Overnight has the fewest consumers precisely because it is **the enterprise batch
peak**, and it also falls inside the noise restriction. The viable window is usually
in the gap between the two peaks.

## 3. How the noise restriction is applied

Preparatory work (cabling, rigging, configuration) **is** allowed during restricted
hours; noise-generating work (drilling, lifting, generators) is not. So the test is:

```
Overlap between window and restricted hours > 30 min  ->  conflict
Overlap <= 30 min                                     ->  acceptable
```

## 4. Prohibited

- Do not push a window into restricted hours in order to dodge the batch peak.
- Do not notify customers before all three conditions are confirmed.
- Do not compress the standard duration to fit a shorter window.
