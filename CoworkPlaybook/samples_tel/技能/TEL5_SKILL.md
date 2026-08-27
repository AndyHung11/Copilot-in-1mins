---
name: 企業專線 SLA 違約金判定
description: |
  Use when the user provides monthly enterprise leased-line outage data and asks to
  determine SLA breaches, calculate service credits, or draft customer compensation
  notices. Triggers on phrases such as "SLA 月結", "專線違約金", "服務等級協議賠償",
  "leased line SLA", "service credit calculation", "monthly SLA settlement".

  Do NOT use for: consumer broadband complaints (use the 消費者申訴回覆 skill instead);
  personal data breach notifications (use the 個資外洩通報 skill instead); general
  billing disputes that do not involve an enterprise leased-line SLA.
---

# 企業專線 SLA 違約金判定

## 何時使用這個技能

使用者提供當月企業專線中斷資料，並要求判定是否違反 SLA、計算違約金，
或草擬給企業客戶的賠償通知時使用。

## Scope Boundaries

**This skill handles enterprise leased-line SLA only.**

- 消費者寬頻／行動門號的申訴 → 不處理，改用「消費者申訴回覆」技能
- 個資外洩事件通報 → 不處理，改用「個資外洩通報」技能
- 不涉及 SLA 的一般帳單爭議 → 不處理

If the request mixes enterprise SLA with another topic, handle only the SLA portion
and explicitly state which parts were left out and which skill should handle them.

## 計算規則

### 步驟 1：算出實際中斷時數

```
實際中斷時數 = 本月總中斷時數 − 事前公告之計畫性維護時數
```

**Always subtract announced planned maintenance before applying any threshold.**
Never judge a breach from the raw total outage hours alone.

### 步驟 2：判定是否賠償

符合任一即賠償：
- 實際中斷時數 ≥ 4 小時
- 可用率 < 99.5%（可用率 = (720 − 實際中斷時數) ÷ 720）

### 步驟 3：決定比率（依實際中斷時數）

| 實際中斷時數 | 違約金 |
|---|---|
| 4h 以上未滿 8h | 月租費 5% |
| 8h 以上未滿 24h | 月租費 15% |
| 24h 以上 | 月租費 30% |

若**僅因可用率未達 99.5%**而中斷未滿 4h，比率為月租費 5%。
兩條件同時成立時**不重複累計**。

## Output Format

先輸出一張判定總表，再逐一輸出每家客戶的通知信草稿。

### 判定總表

| 客戶 | 專線編號 | 總中斷 | 計畫性維護 | 實際中斷 | 可用率 | 判定 | 違約金 |

### 每封通知信草稿必含

1. 客戶名稱與專線編號
2. 實際中斷時數（**須註明已扣除的計畫性維護時數**）
3. 可用率
4. 適用條件與比率
5. 違約金金額與次月帳單折抵方式
6. 改善措施

## Robustness

- If required data is missing, write `[待確認]` and **never** invent a figure.
  Always ask rather than guess when the outage hours or monthly fee are absent.
- If planned-maintenance hours are not supplied, **do not assume zero** — state that
  the figure is unconfirmed and that the result may change once it is provided.
- **Always** draft compensation notices for human review. **Never** send them directly.
- Each customer must receive a separate notice. **Never** combine multiple customers
  into one email or copy one customer on another's notice.
- Because this skill commits the company to a monetary amount, **always** confirm each
  notice individually. **Never** request bulk approval for the whole batch.
