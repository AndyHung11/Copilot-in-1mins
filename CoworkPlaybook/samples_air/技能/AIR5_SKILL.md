---
name: 機坪安全事件分級與通報
description: |
  Use when a ramp or ground-handling safety event is reported and the user asks for a
  severity classification or a drafted safety notification. Triggers on phrases such as
  "機坪事件", "地面安全通報", "航機擦撞", "ramp safety event", "ground incident
  classification", "安全事件分級".

  Do NOT use for: in-flight safety occurrences (use the 飛航事件調查 skill instead);
  crew duty-time or FTL questions (use the 組員飛時檢查 skill instead); aircraft
  maintenance defect reporting with no ground-handling event involved.
---

# 機坪安全事件分級與通報

## 何時使用這個技能

使用者提供機坪或地面作業安全事件內容，並要求判定分級或草擬通報時使用。

## Scope Boundaries

**This skill classifies ground and ramp safety events only.**

- 飛航中事件（亂流傷害、空中回轉） → 不處理，改用「飛航事件調查」技能
- 組員飛時與派遣問題 → 不處理，改用「組員飛時檢查」技能
- 純機務故障且無地面作業事件 → 不處理

If a report mixes a ramp event with another domain, classify only the ramp portion and
state explicitly what was excluded and which skill should handle it.

## 分級規則

| 等級 | 條件 |
|---|---|
| A | 人員死亡或重傷、航機結構重大損傷、失火 |
| B | 人員受傷需送醫、航機損傷影響適航 |
| C | **航機任何實體損傷**（含刮痕、凹陷、蒙皮受損），無人員傷害 |
| D | 無人員傷害**且無航機損傷**之作業異常 |

### Safety Red Lines

- **Always** classify at C or above whenever the aircraft sustained any physical damage,
  however minor it sounds. "No injuries" **never** justifies a D classification when the
  airframe was damaged.
- **Always** query the ramp safety event log for the same tail number over the previous
  90 days before finalising a classification. If three or more events are found,
  **always** escalate to B regardless of the current event's own severity.
- **Never** downgrade a classification because the reporter described the event as minor.
  Classify from the stated facts, not from the reporter's tone.
- Any event involving fuel leakage is **always** B or above.

## Robustness

- If it is unclear whether the aircraft was damaged, **never** assume it was not.
  Always ask, and record the item as `[調查中]` until confirmed.
- If the tail number is missing, **always** ask for it — the 90-day history check cannot
  be performed without it, so no classification may be finalised.
- When information is insufficient to apply a rule, **always** escalate to the duty safety
  manager rather than guessing a lower severity.
- **Always** draft notifications for human approval. **Never** send them directly.

## Output Format

### 分級判定

| 項目 | 內容 |
|---|---|
| 事件編號 / 時間 / 機尾號 / 站別 | |
| 事件經過 | |
| **初判等級與依據條文** | |
| **同機尾號近 90 天事件** | 件數與編號，即使為 0 也要寫 |
| **是否觸發升級規則** | 是／否，並說明依哪一條 |
| **最終等級** | |
| 通報時限 | |

### 通報草稿

依上表內容撰寫，未確認事項一律寫 `[調查中]`。
