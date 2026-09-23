# Yield Excursion Procedure

**Document**: QP-QA-023　**Revision**: Rev.G　**Effective**: 2026-05-15

## 1 Control limit

The lot yield control limit for all production devices is **93.0%**.
Any lot below the limit is classed as an excursion lot and enters root-cause work.

## 2 When to start

- A single lot below the limit: record and monitor.
- **Two or more lots** below the limit, consecutive or cumulative: open a formal
  investigation immediately.

## 3 Investigation requirements

### 3.1 Time limit

The investigation shall reach a conclusion within **three working days**.

### 3.2 How factors are compared

The investigation **shall not look only at the failing lots**. Every process condition
of the excursion lots must be compared item by item against the normal lots from the
same period — including but not limited to tool, **chamber**, shift, raw material lot
and fixture ID.

A factor qualifies as the common factor only when:

1. it appears in **every** excursion lot, and
2. it appears in **none** of the normal lots.

A factor meeting only the first condition is "partially correlated" and shall not be
declared the root cause.

### 3.3 Equipment factors

Where the common factor points at a tool, the maintenance log for that tool shall be
reviewed to confirm that chamber qualification was completed for **every chamber**
after the most recent maintenance. On a multi-chamber tool, qualifying only some
chambers counts as qualification not completed.

## 4 Containment

Within **24 hours** of confirming the root cause:

1. Take the suspect tool or chamber offline; no further material may be started on it.
2. Apply expanded sampling to every lot produced by that tool or chamber since the
   suspect point in time.
3. Notify Process Engineering and Equipment Engineering within the same shift.

## 5 Closure

The case may be closed once containment is complete and three consecutive lots have
returned above the control limit.
