# Cold Chain Handling Standard (extract)

> Document owner: Engineering · Technical Services　|　ZV-CGO-S-0082　|　Revision 3.1

## 1. Cumulative temperature excursion

Acceptance of temperature-controlled cargo does not depend on staying inside the
range for the whole journey. It depends on **the cumulative excursion time across
the entire chain staying within the limit set for that consignment**.

The clock starts when the goods leave the shipper's cold room and covers:

```
Consolidation -> customs -> airport cold store -> loading -> flight -> clearance -> cold-chain truck -> consignee cold room
```

⚠️ **A maintenance delay is rarely the problem in itself. The problem is whether it
causes the shipment to miss the next time window.** A four-hour delay that does not
affect the connection consumes four hours of allowance. If it causes the shipment to
miss the truck's cut-off for the day, the extra cold-store wait is several times
larger.

## 2. The destination connection window

| Item | Rule |
|---|---|
| Cold-chain truck cut-off, same day | 18:00 local |
| Earliest collection next day | 08:00 local |
| Cold-store wait after a missed cut-off | Counted as 14 hours of excursion |

## 3. Order of assessment

When anything threatens the arrival time, answer three questions in order:

1. What temperature-controlled cargo is on this flight? What is each consignment's
   limit and how much has already been consumed?
2. After the delay, will the revised arrival still make the cut-off for the day?
3. If not, does the cumulative excursion including the cold-store wait exceed the
   limit?

**The answer to the third question is what must be reported.** Reporting only "the
aircraft is N hours late" leaves the consignee unable to decide whether to initiate
a return or a re-test.

## 4. Who to notify

Where the projected cumulative excursion exceeds the limit, notify all of:

- Cargo load control (Chia-Jung Wu) — to assess re-routing or return
- Operations control (Chih-Ming Huang) — to assess schedule changes
- The consignee — contacted by Cargo. **Engineering must not notify the consignee
  directly.**

## 5. Prohibited

- Do not look at the delay for one sector without working through the whole chain.
- Do not assume "the next flight will pick it up". Check the actual interval to the
  next service.
- Engineering must not contact the consignee or the shipper directly.
