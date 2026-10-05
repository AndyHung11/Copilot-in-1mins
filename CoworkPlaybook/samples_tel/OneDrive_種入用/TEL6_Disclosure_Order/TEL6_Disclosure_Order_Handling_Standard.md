# Disclosure Order Handling Standard (extract)

> Document owner: Network Engineering　|　ZVT-REG-P-0355　|　Revision 2.4

## 1. Order of work on receiving a disclosure order

```
Step 1  Check the formal requirements (issuing authority, case number, subject
        number, requested period, signature)
Step 2  **For each record category**, compare the requested period against the
        statutory retention period for that category
Step 3  Determine, per category: full disclosure / partial / unable to provide
Step 4  Reply within the deadline, stating the legal basis for anything withheld
```

⚠️ **Step 2 is per category, not for the order as a whole.** Retention periods
　 differ by category, so one order will commonly be partly serviceable and partly
　 beyond retention.

## 2. Statutory retention periods

| Record category | Retention |
|---|---|
| Call detail records | 12 months |
| Internet session logs | 6 months |
| Billing records | 60 months |
| Cell site location records | 6 months |

## 3. How to decide

```
Retention start = date received − retention period

Order start >= retention start  ->  full disclosure for that category
Order start <  retention start  ->  **partial disclosure** from the retention start;
                                     state that the earlier portion is beyond
                                     retention and cannot be provided
```

⚠️ **Do not refuse the whole order because part of it cannot be met**, and do not
　 treat the whole period as available because part of it is — data beyond
　 retention has been deleted and cannot be produced.

## 4. The reply must state

1. Issuing authority, reference number and date of the order
2. Disposition **for each record category** — period available, period withheld and
   the legal basis for withholding
3. Format of the data provided and method of delivery
4. Case handler and contact details

## 5. Deadline

Reply within **7 calendar days** of receipt.

## 6. Prohibited

- Do not provide data outside the period stated in the order.
- Do not provide data for numbers other than the subject number stated.
- Do not refuse outright because the data is incomplete; provide what is available.
- Do not let the deadline pass without replying.
