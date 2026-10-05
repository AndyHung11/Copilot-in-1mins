# Alarm Triage and Root Cause Procedure (extract)

> Document owner: Network Engineering　|　ZVT-NOC-P-0112　|　Revision 2.4

## 1. Why alarm count is the wrong signal

A mobile network is a **tree**: an aggregation node carries dozens of cells beneath it.
When the aggregation node goes down, **every cell under it raises its own alarm**,
while the node itself usually raises just one.

So "the element with the most alarms" tells you **where the damage reached**, not
**what caused it**. Work the list by alarm count and you will spend your time on
symptoms, with the element that actually needs a crew sitting at the bottom.

## 2. Root cause test

```
Step 1  Group alarms by network element and look up each element's parent in the
        topology register.
Step 2  For each aggregation node, check whether **every** element beneath it has
        alarmed.
        All of them  -> that node is a root cause candidate
        Only some    -> that node is not the cause; the fault is in individual cells
Step 3  Where several candidates remain, take the one highest in the topology.
```

⚠️ **"Every" is the operative word.** Twenty-two alarms out of twenty-three cells
means twenty-two separate events. All twenty-three means the parent took them down
together.

## 3. Disposition

| Verdict | Action |
|---|---|
| Aggregation node is the cause | Dispatch to the node. **Do not raise separate work for each cell beneath it.** |
| Individual cell fault | Dispatch to that cell |
| Transport degradation (minor) | Monitor; no immediate dispatch |

## 4. Common misjudgements

1. **Sorting by alarm count.** See section 1.
2. **Reading only critical alarms.** The node does raise a critical, but the cells
   beneath raise majors in numbers large enough to bury it.
3. **Opening a separate ticket for every cell under one node.** Raise one ticket on
   the node with the cells attached to it.

## 5. Prohibited

- Do not determine a root cause without consulting the topology register.
- Do not dispatch separately to cells already covered by a node-level root cause.
- Do not auto-close minor alarms without recording them.
