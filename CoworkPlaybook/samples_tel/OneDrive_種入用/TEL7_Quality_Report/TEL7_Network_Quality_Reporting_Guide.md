# Network Quality Reporting Guide

> Document owner: Network Engineering　|　ZVT-NOC-P-0440　|　Revision 2.4

## 1. A monthly report must not stop at the network total

The network drop-call rate is a **traffic-weighted average**. High-volume regions
dominate it; a low-volume region can degrade badly and **barely move the number**.

So "the network met target" and "there is no problem" are different statements. A
region carrying a tenth of network traffic can triple its drop rate while the
network figure shifts by a few hundredths of a point — meanwhile its subscribers
are dropping calls every day and complaints are climbing.

## 2. Four views the report must contain

| View | Content |
|---|---|
| Network | Drop rate for the month, against target, against prior month |
| **Regional** | Drop rate per region, against prior month, against other regions |
| **Complaint cross-check** | Complaint volume and share per region, set against that region's drop rate |
| Exclusion test | The network figure **with the worst region removed**, to quantify how much is being masked |

⚠️ **The exclusion test is the standard way to surface a problem hidden by an
　 average.** If removing one region visibly improves the network figure, that
　 region is dragging the network on its own.

## 3. Identifying an outlier region

A region meeting both of the following is listed separately in the report with a
remediation plan:

1. Drop rate at least **3×** the average of the other regions
2. Complaint share **materially higher** than its share of call volume

## 4. Target

Network drop-call rate target: **0.5%**.

⚠️ The target is a network figure. **Meeting it is not a conclusion that every
　 region is sound.**

## 5. Prohibited

- Do not draw the report's conclusion from the network total alone.
- Do not present complaint data and KPI data without cross-referencing them.
- Do not list a region as an outlier without a remediation plan.
