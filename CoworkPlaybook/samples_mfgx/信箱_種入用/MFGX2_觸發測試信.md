# MFGX2 觸發測試信（課前寄給自己，用來驗證事件觸發任務）

事件觸發任務設定完成後，寄這封信給自己就會觸發。
**主旨必須含「停線」或「Line Stop」**，否則觸發條件不會命中。

---

## 測試信 A — 應被判為 P1（中文）

**主旨**：【停線通報】B產線 CNC-07 主軸異音停機

**內文**：

```
生產經理 您好：

B產線 CNC-07 於今日 09:20 發生主軸異音並自動停機，
目前維修課已到場檢查，初判主軸軸承磨損，需更換軸承。
備品需向原廠調貨，預估最快明日下午到料。

另外，這台 CNC-07 在 8/18 與 8/21 也曾因同樣異音短暫停機，
當時各停約 30 分鐘後自行排除。

本批訂單原訂本週五出貨。

當班班長 王建誠
```

> 判定重點：預估停機遠超過 4 小時、影響週五出貨承諾日，
> 且同一設備 7 天內第 3 次停線 —— 三條件都指向 P1，不能判成 P2。

---

## Test mail A — should be graded P1 (English)

**Subject**: [Line Stop] Line B CNC-07 spindle noise shutdown

**Body**:

```
Dear Production Manager,

Line B CNC-07 stopped automatically at 09:20 today after abnormal spindle noise.
Maintenance is on site; the initial assessment is spindle bearing wear requiring
bearing replacement. The spare must be ordered from the OEM, with the earliest
arrival estimated tomorrow afternoon.

Note that CNC-07 also stopped briefly for the same noise on 8/18 and 8/21,
each cleared by the shift after about 30 minutes.

This order batch was scheduled to ship this Friday.

Chien-Cheng Wang, Shift Supervisor
```

> Grading focus: estimated downtime far exceeds 4 hours, it affects a committed
> Friday ship date, and it is the third stoppage on the same machine within 7 days —
> all three point to P1. It must not be graded P2.

---

## 測試信 B — 應被判為 P3（干擾項，中文）

**主旨**：【停線通報】A產線 換模停機作業完成

**內文**：

```
今日 14:00～14:35 A產線進行例行換模停機，
35 分鐘完成並已恢復生產，無異常。

當班班長 李佩芸
```

> 判定重點：這是例行換模、35 分鐘、可自行排除，應判 P3 並只彙整給當班班長，
> 不該因為主旨有「停線」兩個字就升級通報廠長。
