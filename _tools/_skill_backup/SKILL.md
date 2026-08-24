---
name: "copilot-newsletter-v2"
description: "整理 Power of Copilot newsletter（Power of Agent + Power of Prompt）：抓 weeklyprompt@microsoft.com 寄到 inbox 的 Agent/Prompt of the week 信件，**用 templates/ 系統**產生繁中 + 简中（中国本地化）+ 英文 v1+v2 HTML + .eml（X-Unsent UTF-8 草稿），發布到 GitHub Pages，鏡像到 OneDrive\\CopilotOfWeek\\ 與 TAI SharePoint，更新 index.html（含繁中/简中/EN 三語切換），並 Teams 通知摘要。觸發詞：「整理 newsletter」「Power of Copilot 週報」「copilot-newsletter-v2」「整理上週 Copilot 信」。"
---

# Power of Copilot Newsletter 整理流程

## 工作目錄規範（強制）
- 本 skill 任何**臨時**暫存（`check_dup` 的 `cand.txt`、一次性抓取全文、測試渲染）放 **`C:\temp\copilot-newsletter-v2\_working\`**，不要散在 `C:\temp\` 根目錄。開工前先 `New-Item -ItemType Directory -Force C:\temp\copilot-newsletter-v2\_working | Out-Null`。
- 例外（維持原路徑，不搬）：`C:\temp\PowerofCopilot\`（含 `zh\`、`en\`、`_sources\`、`_tools\`、`index.html` 等）為持久 git repo（remote = AndyHung11/Copilot-in-1mins），一律維持原路徑照既有流程使用。

## 觸發
使用者說「整理 newsletter」「Power of Copilot 週報」「整理上週 Copilot 信」「/copilot-newsletter」等。
也可由 Teams 訊息或新對話手動觸發、或排程 `cmjsokuamoqquf0p`（每週一 09:00）自動執行。

## 預設範圍
**上週一 00:00 ~ 上週日 23:59 (Asia/Taipei)**。
若使用者指定其他範圍，照他指定的做。
若「補做 / 接續上次後」，讀 `_catalog_index.json` 的 `generated` 時間戳，從那天之後到今天。

## 前置檢查
1. `m_m365_status`，若 `signedIn: false` 呼叫 `m_m365_sign_in` 並等待完成。
2. 確認 `C:\temp\PowerofCopilot\` 下 v1/v2 × Agent/Prompt 八個子資料夾與 `_tools\rebuild-index.ps1` 都在。

## 來源
- 寄件人：`weeklyprompt@microsoft.com`（WeeklyPrompt 系列），或 `notifications_microsoft@engage.mail.microsoft`（Eva Etchells / Viva Engage ✨ Microsoft 365 Copilot 社群貼文）
- 主旨包含：`Agent of the week` 或 `Prompt of the week`（Eva Etchells 來源還有創意標題的 Prompt/Agent tips）
- 資料夾：**只搜 inbox**（已歸檔的在 `Tips\{WeeklyPrompt,Eva-Engage}` 與其 `Done` 子資料夾，不重複處理）
- 排除 `Welcome`、`We miss your ideas`、純招募信
- 用 `m365_list_emails` 配合 startDate/endDate + from 過濾較穩
- ⚠️ **Eva Etchells（Viva Engage）信件內文只有預告就斷掉**（`Show More in Viva Engage`），完整 prompt/agent 內容要用瀏覽器開信中的 thread 連結（`engage.cloud.microsoft/.../articles/...`）抓全文，再建 source.json

## 分類
- 主旨含 `Agent of the week` → **Agent**
- 主旨含 `Prompt of the week` → **Prompt**
- 同主題的英/德版只留一份（優先英文）

## 目錄結構

```
C:\temp\PowerofCopilot\
├── zh\{v1,v2}\{Agent,Prompt}\         A###_{Name}.html / P###_{Name}.html (繁中)
├── zh\{v1,v2}\{Agent,Prompt}\eml\     .eml（X-Unsent UTF-8 草稿，雙擊用 Outlook 開）
├── en\{v1,v2}\{Agent,Prompt}\         A###_{Name}_EN.html / P###_{Name}_EN.html
├── en\{v1,v2}\{Agent,Prompt}\eml\     _EN.eml
├── _sources\{Agent,Prompt}\           A###.json / P###.json (template source)
├── _catalog_index.json                流水號→檔名 索引
├── tag_map.json                       場景標籤（任務/工具軸），index_v2 sidebar filter 用
├── index.html                         Classic 索引
├── index_v2.html                      New 索引
└── _tools\                            建置工具（不發布；.gitignore 已排除）
    ├── build_prev_zh.py               抽繁中 description preview（rebuild 自動跑）
    ├── build_zh_cn_sources.py          從繁中 source 產生简中（中国本地化）暫存 source
    ├── build_prev_zh_cn.py            抽简中 description preview（rebuild 自動跑）
    ├── build_tag_map.py               把 tag_map.json 轉成 TAG_MAP JS（rebuild 自動跑）
    ├── _prev_zh.js, _prev_zh_cn.js, _tag_map.js  上述腳本輸出（不要手動編輯）
    ├── rebuild-index.ps1              一條龍：CATALOG + PREV_ZH + PREV_ZH_CN + TAG_MAP + pack-zip
    ├── pack-zip.ps1                   打包 PowerOfCopilot.zip
    └── make_eml.ps1                       產生 .eml（純文字，無 Outlook COM）
```

⚠️ 繁中一律 `zh\v1\`/`zh\v2\`，简中（中国本地化）一律 `zh-cn\v1\`/`zh-cn\v2\`，英文一律 `en\v1\`/`en\v2\`。同 seq 三語檔名分別為無後綴 / `_CN` / `_EN`。

## 流水號規則
讀 `_catalog_index.json` 的 `Agent_v1` / `Prompt_v1` 最大 `seq`，新項目用下一個。

## HTML `<title>` 必須的格式
- Agent: `<title>Copilot 一分鐘小教室：Power of Agent #A### — {中文 Agent 名稱}</title>`
- Prompt: `<title>Copilot 一分鐘小教室：Power of Prompt #P### — {中文功能概要}</title>`

分隔符必須是**全形破折號 `—` (U+2014)** 前後各一個半形空格。v1/v2 title 必須完全一致。

## 處理流程（每封信）

**統一走 template 系統，不手刻 HTML**。Template 在 `C:\Users\chhung\.copilot\m-skills\copilot-newsletter-v2\templates\`。

### 1. 解析信件 → 寫 source.json
讀信件本文產生 `_sources\Agent\A###.json`（或 Prompt）。

🚨 **欄位分兩類，處理原則不同（2026-07 教訓）：**
- **核心產物 = 忠於原文，不改寫**：Agent 的 `instructions_*_html`、Prompt 的 `prompt_*_html` **就是產品本身**（使用者會複製去 Copilot Studio 建 agent / 貼進 Chat 跑）。**英文 `_en` 必須逐字照原信**（含對照表、量表、編號步驟等結構，一列一格都不能省或濃縮成 bullet）；`_zh` / `_zh_cn` 是**忠實翻譯**（保留同樣結構；简中用陸用詞但不改語意）。**嚴禁把官方 instructions／prompt 濃縮、改寫、換順序**——那會讓建出來的 agent 行為跟官方版不一致。
- **行銷敘事 = 改寫並在地化**：`story_*`、`pain_points_*`、`hero_*`、`tips_*`、`headline`、`tagline`、`what_section_*`、`quick_start_*`、`cta_*` 這些是為了吸睛，**要用各語言在地口吻重寫**（简中還要過 OpenCC 相似度自檢，見下方简中段）。

必填：

- `seq`, `name` (英文), `cname` (中文), `license` (`required` | `free`)
- `source_email_id`（**必填**，來源信的 Graph message id；供 `check_dup.py` message-level 去重）
- `description_zh`, `description_en`
- `story_zh_html`, `story_en_html`（v1 情境故事，3 段式 hook；**zh / en 兩語言都要填**，缺一邊 v1 該語言情境會整段消失）
- `instructions_zh_html`, `instructions_en_html`（**核心產物，見上方原則——en 逐字、zh 忠譯**）
- `example_prompt_zh`, `example_prompt_en`
- v2 額外：`hero_subtitle_zh/en`、`pain_points_zh/en`（3 個 punchy 痛點）、`quick_start_zh/en`（3 步驟）
- **選填** `license_note_zh` / `license_note_en`：覆寫 v2 底部的 license 註腳（紅字）。不填則用 strings.json 預設（見下方 license 段）。Outlook 基本版情境用此欄位加註執行通道（範例見下）。

#### `license` 判定準則（Andy 逐項驗證固化，2026-06）

判斷基準＝**「免費 Copilot Chat 能不能跑這個情境」**。要看 prompt / instructions / **example** 的實際用法，不能只看 description。

- **`free`**（免費 Copilot Chat 即可）：
  - 把素材**貼上**或**上傳**到 Copilot Chat（含上傳文件給 PowerPoint agent / 一般 agent 比對）
  - 純文字生成、純網路研究（Web 模式）、出圖（Designer）
- **`required`**（需付費 M365 Copilot 授權）：
  - Office app **內嵌 Copilot 編輯**：Word / Excel / PowerPoint **in-app**（在 app 裡開 Copilot 直接改檔）
  - **WorkIQ（前稱「Work 模式 / Work mode」）抓組織資料**：我的信箱 / 會議 / 行事曆 / Teams 逐字稿 / SharePoint / tenant 內容
  - **Analyst Agent**（進階推理）
  - **連結知識庫**（Agent 綁定組織內部知識來源）
- **重大例外**：**Copilot in Outlook 基本版免授權**（桌面 + web 都有，收件匣/行事曆有基本功能）→ Outlook 場景即使「在 app 內」也填 `free`。此例外**僅限 Outlook**；Word/Excel/PowerPoint in-app 仍 `required`。

#### WorkIQ 提醒（2026-06，Andy 指定）
「Work 模式 / Work mode」已更名為 **WorkIQ**。撰寫 source.json 時：
- 文案一律用 **WorkIQ**，不要再寫「Work 模式 / Work mode」（首次出現可加註「（前稱 Work 模式）」說明）。
- **凡是 `required` 且靠 WorkIQ 抓組織資料的 prompt**（信箱 / 會議 / Teams / 行事曆 / SharePoint），prompt 標頭與 tips **第一條**都要提醒**先開啟 WorkIQ**，否則只會得到空泛內容。範例 tips：「🔓 先開啟 WorkIQ — 這個 prompt 要讀你的 Teams／會議／信件等組織資料，務必在 Copilot Chat 開啟 WorkIQ 才抓得到」。

#### Outlook free 情境的備註慣例（2026-06，Andy 指定）

當情境是 **Outlook 內用 Copilot**（如收件匣摘要、追進度、抽待辦）填 `free` 時：
- **不要強調「新版 / new」Outlook**（基本版桌面 + web 都能用，不限新版）。story / prompt / hero_subtitle 一律寫「Outlook」即可。
- **底部加自訂備註**，用 `license_note_zh` / `license_note_en` 點出基本版的執行通道。標準文案：
  - zh：`＊本 Prompt <b>無需 M365 Copilot 授權</b>。若你是 Microsoft 365 Copilot 基本版使用者，請於 Outlook 中的 <b>Copilot in Outlook</b> 執行。`
  - en：`＊This Prompt requires <b>no M365 Copilot license</b>. If you're on Microsoft 365 Copilot (basic), run it via <b>Copilot in Outlook</b>.`
- 純 Chat 貼上情境（非 Outlook）**不需**自訂備註，用 strings.json 預設即可。

#### badge / note 預設文案（strings.json，2026-06 已更新）

free 的 badge 與底部 note 統一用「**基本版即可使用 / Works in the basic version**」（不再寫「Copilot Chat (Web)」）：
- `LICENSE_BADGE_FREE`（zh）：`🆓 不需 M365 Copilot 授權，基本版即可使用`
- `LICENSE_NOTE_FREE_PROMPT`（zh）：`＊本 Prompt <b>無需 M365 Copilot 授權</b>，基本版即可使用。`（AGENT 版同理）
- en 對應：`Works in the basic version`

required 的底部 note 統一精簡為只講授權需求（不再寫「並透過 Copilot Chat (Work) 使用 / Use via Copilot Chat (Work)」）：
- `LICENSE_NOTE_REQUIRED_PROMPT`（zh）：`＊本 Prompt 需具備 <b>Microsoft 365 Copilot 授權</b>。`（AGENT 版同理）
- en 對應：`＊This Prompt requires a <b>Microsoft 365 Copilot license</b>.`
- required 的 badge 維持：`🔑 需 M365 Copilot 授權`
- render.ps1 邏輯：source 有填 `license_note_$Lang` 就優先用，否則退回 strings.json 的 `LICENSE_NOTE_FREE/REQUIRED_PROMPT/AGENT`。

**改 `required`→`free` 時的連動**：若該情境原本寫「在 app 裡用 / 連知識庫 / 抓 Teams 會議」，**小撇步（`tips_*` 與 `tips_list_*`）也要改寫**成貼上/上傳的免授權路徑（兩個欄位都要改才一致，license badge 由 render.ps1 自動連動但 tips 不會）。可保留付費直連選項但加註「（但需要進階授權）」。

⚠️ **pain_points 必須是 END USER 痛點（rant 風格）**，不是描述。emoji + 兩行短句。
⚠️ **英文欄位主題一致性檢查（2026-06 教訓）**：部分早期項目的 `prompt_en_html` / `pain_points_summary_en_html` / `tips_en_html` 被別篇內容污染（例如待辦彙整篇混進「Researcher / executive brief on [TOPIC]」研究員內容）。**修改或重渲染既有項目時，務必比對英文欄位與中文是否同主題**；常見污染關鍵字：`Researcher`、`executive brief`、`[TOPIC]`、`[ROLE]`，以及通用罐頭 tips（`Paste the prompt directly` / `Replace any bracketed placeholders`）。發現就改成與 zh 一致的正確翻譯。
⚠️ **`quick_start_zh_html` / `quick_start_en_html` 不要包標題 `<div>`**，template 自己加。
⚠️ **`tips_list_*_html` / `what_section_*_html` 結構規則（重要，否則 Classic Outlook 跑版）**：
  - 這些欄位**只放內層 `<tr>...</tr>` 列**，**不要**自帶區塊標題 `<div>` 或外層 `<table>`——template (`prompt_v2.html` L76-84 WHAT、L111-117 TIPS) 已提供標題 + `<table>` 包裝。
  - 每個內層 `<table>` 都要正確閉合（`<table>` 數量 = `</table>` 數量），不要只關 `</tr>`。
  - 禁止出現 wrapper 簽名 `padding:28px 36px 0 36px`（那是 template 的 td，欄位內不該有）。
  - 乾淨格式參考 `sample_source_prompt.json` 的 `tips_list_zh_html`（3 個獨立 `<tr><td><table>…</table></td></tr>`）。
  - 瀏覽器/New Outlook 會自動修復破損 HTML 所以看起來正常；Classic Outlook 的 Word 引擎嚴格 → 表格垮成直排。**只影響 zh/v2**（v1 與 en 用不同欄位/渲染）。
⚠️ **絕對不要 `_zh` / `_zh_html` 欄位留空白**（`_en` / `_en_html` 同理）。必補欄位見上方清單。任一語言欄位有內容、對應的另一語言留空時，`render.ps1` 會印出 `WARNING: [seq] '..._en' is filled but '..._zh' is EMPTY` ——看到就要補齊，否則該語言該段內容會靜默消失（不會出現 `{{MISSING}}` 標記）。`description_zh_html` 會被 `build_prev_zh.py` 抽出當 index_v2 中文卡片預覽。

### 2. 渲染三語 HTML（繁中 / 简中中国本地化 / 英文）
```powershell
$render = 'C:\Users\chhung\.copilot\m-skills\copilot-newsletter-v2\render.ps1'
$src    = 'C:\temp\PowerofCopilot\_sources\Agent\A###.json'
$name   = 'A###_{PascalName}'
& $render -Source $src -Lang zh -Version v1 -OutDir 'C:\temp\PowerofCopilot\zh\v1\Agent' -OutFile "$name.html"
& $render -Source $src -Lang zh -Version v2 -OutDir 'C:\temp\PowerofCopilot\zh\v2\Agent' -OutFile "$name.html"
pwsh -ExecutionPolicy Bypass -File C:\temp\PowerofCopilot\_tools\render_all_languages.ps1 -Langs zh-cn
& $render -Source $src -Lang en -Version v1 -OutDir 'C:\temp\PowerofCopilot\en\v1\Agent' -OutFile "${name}_EN.html"
& $render -Source $src -Lang en -Version v2 -OutDir 'C:\temp\PowerofCopilot\en\v2\Agent' -OutFile "${name}_EN.html"
```

Prompt 把 `Agent` / `A###` 換成 `Prompt` / `P###`。`-OutDir` 一定用絕對路徑。

**简中（中国本地化）規則：**
**範圍限制：以下規則只適用於 `zh-cn` 简体中文（中国本地化）輸出；不得修改、覆蓋或套用到既有繁中 `zh` 或英文 `en` 內容。**

🚨 **強制步驟（每個新項目都必做，不可跳過）：建 source.json 時，除了 `*_zh`/`*_en` 欄位，必須同時由 LLM 親自撰寫一整組 `*_zh_cn` / `*_zh_cn_html` 欄位。** 對齊規則：每個有 `_zh`/`_zh_html` 的欄位都要有對應的 `_zh_cn`/`_zh_cn_html`（含 `cname_zh_cn`、`headline_zh_cn`、`story_zh_cn_html`、`prompt_zh_cn_html`/`instructions_zh_cn_html`、`hero_title_zh_cn_html`、`hero_subtitle_zh_cn`、`pain_points_*_zh_cn_html`、`what_section_zh_cn_html`、`tips_zh_cn_html`、`tips_list_zh_cn_html`、`cta_heading_zh_cn` 等）。
- **嚴禁只跑 `build_zh_cn_sources.py` 就交差**：那只是 OpenCC 繁轉簡保底，產出的是台灣用詞硬轉的简体字（例：「主管簡報產生器」→「负责人演示文稿产生器」這種錯誤），**不是**中國本地化，違反本規則。
- **新內容必須由 LLM 直接產生 `*_zh_cn` / `*_zh_cn_html` 欄位**，以中國大陸使用者情境、語氣與用詞撰寫；不要把繁中內容當作唯一來源逐句翻譯。`zh-cn.md` 的推薦替換表只是最低限度提示，LLM 產生時也要主動套用中國本地化概念（例：主管→高管、簡報→简报/演示、提案→方案、中標、黄金搭档…依情境選最自然的陸用詞）。
- 🚨 **只換術語 ≠ 本地化（2026-07 教訓，最常犯）：不能把繁中句子原封不動、只逐詞抽換術語（Agent→智能体、資料→数据…）就交差。** 那樣「骨架還是繁中的、只換了皮」，OpenCC 相似度會高達 ~0.97，等同半套繁轉簡，仍違規。**句式、語序、行銷口吻都要用陸人自然講法重寫**，讓繁中與简中讀起來是「兩個在地作者各寫一遍」，而非「同一句換字」。行銷短句（headline、hero_title、tagline、cta_heading）尤其不能只做字形轉換（選→选 之類）——這些最容易變成 1.0 純機轉，要主動改寫句式或用陸味說法。
- ✅ **render 後強制驗證（兩關）**：
  1. `zh-cn` HTML 不得殘留台灣用詞或繁轉簡痕跡（產生器、簡報、提案、行事曆、檔案、台灣口語…），且 `<title>` 的简中名要是 LLM 版（非繁轉簡）。用 grep 抽查。
  2. **OpenCC 相似度自檢**：把每個 `*_zh` 欄位用 `opencc t2s` 轉簡後，跟你寫的 `*_zh_cn` 逐欄比對 difflib 相似度。**平均 >0.90、或任何非極短欄位 =1.0，代表你只做了機械繁轉簡 → 必須重寫該欄位**。目標是讓相似度明顯低於 0.9（術語＋句式都不同）。範例腳本：
     ```python
     import json, re, difflib
     from opencc import OpenCC
     cc = OpenCC('t2s')
     d = json.load(open(src, encoding='utf-8'))
     strip = lambda s: re.sub(r'<[^>]+>','',str(s))
     for k in [x for x in d if x.endswith('_zh') or x.endswith('_zh_html')]:
         base = k[:-3] if k.endswith('_zh') else k[:-8]
         cnk = base+'_zh_cn'+('_html' if k.endswith('_html') else '')
         if cnk in d:
             r = difflib.SequenceMatcher(None, cc.convert(strip(d[k])), strip(d[cnk])).ratio()
             print(f'{base:28s} {r:.3f}', '⚠機轉' if r>0.9 else 'OK')
     ```
- render `-Lang zh-cn` 會優先讀 `*_zh_cn` / `*_zh_cn_html` 欄位。`_tools\build_zh_cn_sources.py` 只作為舊內容回填/保底工具：缺少 zh-cn 欄位時才由繁中 OpenCC + glossary 產生暫存欄位；已存在的 LLM zh-cn 欄位不得被覆蓋。
- Microsoft 產品名保持英文：Microsoft 365 Copilot、Copilot Chat、Outlook、Teams、PowerPoint、Excel、Word、SharePoint、WorkIQ 不翻譯。
- Prompt/Agent 內的複製按鈕必須依語言顯示：繁中 `複製` / `已複製`，简中 `复制` / `已复制`，英文 `Copy` / `Copied`；不得再出現 `複製 Copy` 或 `已複製 Copied` 的中英混排。
- 中國用語方向：簡報→演示文稿、投影片→幻灯片、試算表→电子表格、檔案→文件、資料夾→文件夹、收件匣→收件箱、行事曆→日历、授權→许可、使用者→用户、專案→项目、行銷→营销、標竿→标杆、指針→指标。
- 語氣要符合中國企業培訓：直接、正式、少台灣口語；但保留原 prompt 的核心任務與產品事實，不改成中國本地第三方工具或非 Microsoft 服務。

### 3. 產 .eml（zh / zh-cn / en × v1/v2 × Agent/Prompt = 全部變體；純文字，無 Outlook COM）

🚨 **順序重要：先跑 `rebuild-index.ps1`（見下方步驟）把新項目寫進 `_catalog_index.json`，再跑 `make_eml.ps1`。** make_eml 是「讀 catalog → 對每個項目產 .eml」，若在 rebuild 前跑，新項目還不在 catalog，會被靜默略過（症狀：新 seq 的 `eml\` 子目錄缺檔，如 A0xx 只有 2/6 或 0/6）。實務順序：render 12 HTML → 補 tag_map → **rebuild-index → make_eml** → 驗證每個新 seq 的 .eml 各 6/6 → 發布。

```powershell
pwsh -ExecutionPolicy Bypass -File C:\temp\PowerofCopilot\_tools\make_eml.ps1
```
讀 `_catalog_index.json`，對每個 html 產生對應 `.eml` 到同層 `eml\` 子目錄。**產完用 `Get-ChildItem -Recurse -Filter "{seq}_*.eml"` 確認每個新 seq 各 6 檔（zh/zh-cn/en × v1/v2），漏了就是 rebuild 沒先跑或沒跑成功。** 配方重點（**不要改回 .msg**）：
- Header：`X-Unsent: 1`（Outlook 開成可編輯草稿，非唯讀收件）、`Subject:`（多段 RFC2047 編碼，每段 ≤39 UTF-8 bytes）、`MIME-Version: 1.0`、`Content-Type: text/html; charset="utf-8"`、`Content-Transfer-Encoding: base64`
- Body：HTML 去 BOM → base64 每 76 字元換行
- 用 `[Text.Encoding]::ASCII` 寫檔
- 重新產生既有 `.eml` 時要沿用原本的 `Date:` header；新檔才產生新的 `Date:`。不要每次用目前時間覆寫所有檔，否則會造成 500+ 個只有日期不同的無意義 git diff。
- **為何不用 .msg**：Outlook `SaveAs(...,3)`=olMSG(ANSI) 在 New Outlook 主旨/內文亂碼；olMSGUnicode 也只修主旨；COM `HTMLBody` setter 會把實體字元正規化回中文 → .msg 無解。.eml 是標準 MIME，跨平台、編碼正確、不需 COM（快且穩）。

**Subject：**
- ZH Agent: `Copilot 一分鐘小教室：Power of Agent #A### — {中文名}`
- ZH Prompt: `Copilot 一分鐘小教室：Power of Prompt #P### — {中文名}`
- ZH-CN Agent: `Copilot 一分钟小课堂：Power of Agent #A### — {简中名}`
- ZH-CN Prompt: `Copilot 一分钟小课堂：Power of Prompt #P### — {简中名}`
- EN Agent: `Copilot in 1 Minute: Power of Agent #A### - {EN Name}`（半形 `-`）
- EN Prompt: `Copilot in 1 Minute: Power of Prompt #P### - {EN Name}`

### 4. （選用）建 Outlook 草稿
`.eml` 本身已是 `X-Unsent: 1` 草稿（雙擊用 Outlook 開即可填收件人寄出），通常不需另建 COM 草稿。**草稿不寄出**。

### 5. 補 tag_map.json（New 版 sidebar filter）— **AI 自動判斷，不問使用者**

每個新項目都要在 `C:\temp\PowerofCopilot\tag_map.json` 的 `entries` 加一筆：
```json
"A048": { "task": ["analysis","strategy"], "tool": ["excel"] }
```

**判斷規則（AI 直接從 source.json 推論，不要問使用者）：**

`task` (≤3) — 看 `description_*` + `instructions_*` 主要動詞：
- `writing` — 起草、撰寫、潤色、改寫信件/文件/簡報文字
- `analysis` — 分析、比較、摘要、彙整數據/文件/趨勢
- `communication` — 回覆信件、聊天回應、會議跟進、簡訊
- `planning` — 排程、議程、行動計畫、待辦清單
- `learning` — 找資料、研究、解釋概念、教學
- `automation` — 多步驟流程、跨工具串接、批次處理
- `strategy` — 高階決策、市場/競品/方向判斷、執行長層級觀點

`tool` (≤3) — 看 source 描述提到的具體應用：
- `outlook` — 信件相關
- `teams` — 會議、聊天、頻道
- `excel` — 試算表、數據
- `powerpoint` — 簡報、投影片
- `word` — 文件、報告
- `general` — 不綁特定 Office app（純 Chat / Web / 跨工具）

**規則：**
- 兩個軸都至少給 1 個、最多 3 個
- 不確定就用 `general`（tool），或主要一個 task
- Agent 偏 `automation` / `strategy` 機率較高；Prompt 偏 `writing` / `analysis` / `communication` 機率較高
- 加完直接存檔，rebuild 會自動 inject

## 重建索引（一條龍）

```powershell
pwsh -ExecutionPolicy Bypass -File C:\temp\PowerofCopilot\_tools\rebuild-index.ps1
```

8 步全自動：
1. 重建 `_catalog_index.json`
2. inject CATALOG → `index.html`（`/*CATALOG-START*/` markers）
3. inject CATALOG → `index_v2.html`（`<script id="CATALOG">` block）
4. 跑 `python build_prev_zh.py` → `_prev_zh.js`
5. inject `PREV_ZH` → `index_v2.html`（`/*PREV_ZH-START*/.../*PREV_ZH-END*/`）
6. 跑 `python build_tag_map.py` → `_tag_map.js`
7. inject `TAG_MAP` → `index_v2.html`（`/*TAG_MAP-START*/.../*TAG_MAP-END*/`）
8. 跑 `pack-zip.ps1` 打包 `PowerOfCopilot.zip`

驗收日誌：
```
  ✓ Updated index_v2.html CATALOG
Wrote N ZH preview entries to ..._prev_zh.js
  ✓ Updated index_v2.html PREV_ZH
Wrote TAG_MAP (N entries) to ..._tag_map.js
  ✓ Updated index_v2.html TAG_MAP
✅ Rebuilt catalog @ ...
📦 Packed 5 items → PowerOfCopilot.zip (X.XX MB)
```

任何 `⚠ markers not found` → 對應 markers 被破壞，手動修。

⚠️ 用 `pwsh` (PS 7)。若用 PS 5.1，HTML 與 script 都必須 UTF-8 with BOM。

## index.html / index_v2.html 已內建 UI（不要拿掉）
hand-edited、不會被 rebuild 蓋過：

**index.html (Classic)：**
- 右上角 toolbar：`📧 用 Outlook 開啟` + `在新分頁開啟 ↗` + `✨ 試用新版 NEW`
- vtoggle: `v1 · 經典` / `v2 · 豐富`
- 中/EN 雙語切換
- Search 旁 sort button（`↓ 新→舊` / `↑ 舊→新`），預設 desc，存 localStorage
- `autoSelectFirst` 自動載入該分類最新一筆

**index_v2.html (New)：**
- nav bar 右：`☀️🌙 主題` + `↺ 回經典版`
- Modal toolbar：`📧 用 Outlook 開啟`（連 `eml/*.eml`，帶 `download` 屬性 → http/https 下會下載；`file://` 會被瀏覽器忽略 download 直接開，屬正常）+ `在新分頁開啟 ↗`
- Sidebar 第一個 section 頂端：`⬇️ 全部下載 (.zip)` 按鈕（連 `PowerOfCopilot.zip`）
- Sidebar tag chip filter（任務/工具軸）
- Sidebar h4 視覺：accent 藍 + 字重 800 + 左邊彩色直條 + 底下 2px 實線；section 之間 1px dashed；letter-spacing:0
- License: `(Basic)` / `(Premium)`
- 內嵌 `PREV_EN` / `PREV_ZH` / `TAG_MAP`（後兩者 rebuild 自動 inject，**不要手動編輯**）

## 發布（GitHub Pages 為主，OneDrive + TAI 為備份）

權威來源：`C:\temp\PowerofCopilot\`（remote `origin` = `https://github.com/AndyHung11/Copilot-in-1mins`）
公開網址：https://andyhung11.github.io/Copilot-in-1mins/

```powershell
$env:PATH = "C:\Program Files\Git\cmd;C:\Program Files\GitHub CLI;$env:PATH"
Set-Location C:\temp\PowerofCopilot
git add .
git commit -m "Weekly update: {YYYY/MM/DD} - +{N} Agent +{M} Prompt"
git push
```

`.gitignore` 只 track `*.html`、`*.eml`、`README.md`、`PowerOfCopilot.zip`、`robots.txt`、`tag_map.json`。每次 push 帶 zip。

**備份鏡像**：
```powershell
$src  = "C:\temp\PowerofCopilot"
$dst1 = "C:\Users\chhung\OneDrive - Microsoft\CopilotOfWeek"
$dst2 = "C:\Users\chhung\Microsoft\FY26 - TAI Collaboration - Documents\Copilot Family\Promotion\PowerofCopilot"
$xd = @(".git","_trash","_bak_*","*_bak_*","__pycache__")
$xf = @("Thumbs.db",".DS_Store")
robocopy $src $dst1 /MIR /XD $xd /XF $xf /R:2 /W:2 /NFL /NDL /NJH /NJS /NP
robocopy $src $dst2 /MIR /XD $xd /XF $xf /R:2 /W:2 /NFL /NDL /NJH /NJS /NP
```

**驗收**：
1. `gh api repos/AndyHung11/Copilot-in-1mins/pages/builds/latest` status = `built`，error.message = null
2. OneDrive / TAI 兩處檔數與本地一致
3. 兩版索引看得到新項目；中文卡片有預覽；tag chip 正確；「全部下載」按鈕能拿到最新 zip

## 通知（Teams 訊息格式）
```
📬 **本週 Power of Copilot Newsletter 整理完成**（補做 {YYYY/M/D}–{YYYY/M/D}）

**新增項目**

⚡ A###　{Agent 中文名}
　_({Agent 英文名})_

💬 P###　{Prompt 中文名}
　_({Prompt 英文名})_

**目前累計**

• v1 — Agent {N} 篇
• v1 — Prompt {N} 篇
• v2 — Agent {N} 篇
• v2 — Prompt {N} 篇

**產出**

📂 Outlook 草稿匣：{N} 封新草稿（未寄出）

🔗 公開網址（Classic）：https://andyhung11.github.io/Copilot-in-1mins/
🔗 公開網址（New 預覽）：https://andyhung11.github.io/Copilot-in-1mins/index_v2.html
🔗 [開啟索引頁](file:///C:/Users/chhung/OneDrive%20-%20Microsoft/CopilotOfWeek/index.html)
```

只有 Agent 或只有 Prompt → 省略不存在的條目。範圍內無符合信件 → 發「本週無新 Power of Copilot newsletter」即可。

## 跳過已處理項目（去重機制，2026-07 強化）

⚠️ **不要只靠信件主旨判斷**：WeeklyPrompt 主旨每週固定是「Agent of the week 🚀 / Prompt of the week」，Eva 是創意標題 —— 主旨與內容對不上，無法用來去重。真正穩定的識別碼是**信件裡實際的 Agent instructions / Prompt 本文（英文原文）**。

**每封候選信件在建 source.json 前，先跑 `_tools\check_dup.py` 硬檢查**（不要只靠 LLM 記憶）：
```powershell
# name = 從信件抽出的 Agent/Prompt 名稱；body = 信件的 instructions / prompt 本文（存成 txt）
python C:\temp\PowerofCopilot\_tools\check_dup.py --kind Agent  --name "Exec Briefing Builder" --bodyfile cand.txt --email-id "<Graph message id>"
python C:\temp\PowerofCopilot\_tools\check_dup.py --kind Prompt --name "FY26 Wrapped"          --bodyfile cand.txt --email-id "<Graph message id>"
```
它會即時掃 `_sources\{Agent,Prompt}\*.json`，用三層比對回傳 JSON `verdict`：
- **`DUPLICATE`**（content_hash / name_key / source_email_id 完全命中）→ **跳過**，摘要註明命中的 seq。
- **`LIKELY_DUPLICATE`**（模糊相似度 ≥ 門檻，name≥0.82 或 body≥0.80）→ **預設跳過**並在摘要標「疑似重複，命中 seq + ratio」；只有你判斷確實是不同內容才續建。
- **`NEW`**（無命中）→ 建新檔。

退出碼：0=NEW、2=LIKELY_DUPLICATE、3=DUPLICATE、1=用法錯誤。

**三層比對邏輯**（`check_dup.py`）：
1. `source_email_id` 完全相同 → 同一封已處理。
2. `content_hash`（instructions/prompt 本文去 HTML、去標點空白、NFKC 小寫後 SHA1）完全相同 → 同內容不同信也擋得住（本週 Exec Briefing Builder / FY26 Wrapped 就是這種）。
3. `name_key`（ename/cname 正規化）完全相同。
4. 以上皆無 → difflib 模糊比對名稱與本文，取最高分判 LIKELY / NEW。

**回填**：不需改動既有 source。`check_dup.py` 每次即時掃 `_sources`，索引恆為最新。`--rebuild-index` 可另存 `_fingerprints.json` 供人工檢視。`rebuild-index.ps1` 尾端會自動刷新該檔。

🚨 **建新 source.json 時務必寫入 `source_email_id`**（Graph message id），供未來 #1 層 message-level 去重；沒有它時 #2 content_hash 仍能兜住同內容。

## 歸檔到 Done（Andy 指定，2026-06）
從 **inbox** 處理 WeeklyPrompt（`weeklyprompt@microsoft.com`）或 Eva Etchells（`notifications_microsoft@engage.mail.microsoft`）的信件後，**無論「做完」或「略過不做」，都要把該封信搬到 Tips 對應子資料夾下的 `Done` 目錄**：
- WeeklyPrompt 來源 → `Tips\WeeklyPrompt\Done`
- Eva Etchells / Eva-Engage 來源 → `Tips\Eva-Engage\Done`

做法：用 `m365_move_email`，destination 給 Done 資料夾的 folder ID。兩個 Done 子資料夾**都已存在**（用 `m365_list_mail_folders` 帶父資料夾 folder ID + recursive 取得；**注意：用路徑名稱字串如 `Tips/WeeklyPrompt` 查會 400 解析失敗，必須用父資料夾的 folder ID**）。批次搬移時注意 Graph 並發上限（HTTP 429 `MailboxConcurrency`）—遇到就稍等數秒重試該封。略過的公告/宣傳信（announce/promo）也一併搬到同一個 Done，保持 inbox 與 Tips 資料夾只剩未處理項目。

## 重要原則
- 每篇必須產 12 個檔案：v1+v2 × ZH+ZH-CN+EN × (html+eml)；外加 1 個 source.json。ZH-CN 是「简体中文（中国本地化）」，不是單純繁轉簡。
- 絕對不要手刻 HTML：一律從 source.json 走 `templates\render.ps1`
- 🚨 简中本地化**新項目必須由 LLM 在 source.json 親自寫 `*_zh_cn` 欄位**（中國本地化，非繁轉簡）；`_tools\build_zh_cn_sources.py` + glossary **只是缺欄位時的 OpenCC 保底回填**，不可當作新項目的唯一簡體來源。render 後務必確認標題、痛點、Prompt、license note 都使用陸用詞且無台灣用詞殘留。
- 渲染後驗證 zh/v2 結構：每檔 `<table>` 數 = `</table>` 數（與乾淨參考 P066 一致），無 wrapper 簽名 `padding:28px 36px 0 36px` 殘留在欄位（template 自身的 4 次出現屬正常）
- 草稿不寄出
- pain_points 必須是 punchy END USER 痛點
- `<title>` 用 `Power of Agent/Prompt #X### — {中文名}` 格式；简中品牌名是 `Copilot 一分钟小课堂`
- `quick_start_*_html` source 不要包標題 `<div>`
- 用 `pwsh` (PS 7) 跑 `rebuild-index.ps1`
- **rebuild-index.ps1 一條龍：CATALOG + PREV_ZH + PREV_ZH_CN + TAG_MAP + pack-zip**
- **tag_map.json 由 AI 自動判斷 task/tool**，不問使用者（除非完全看不出來才問）
- **去重先跑 `_tools\check_dup.py`（content_hash + name_key + 模糊 + source_email_id 四層），不要只看主旨或只靠 LLM 記憶**；`DUPLICATE`/`LIKELY_DUPLICATE` 跳過並在摘要註明命中 seq。新 source.json 必填 `source_email_id`。
- 發布順序：先 GitHub push，再 robocopy 兩個備份目錄（含 `/XD .git`）
- 兩個 index 各有 hand-edited UI（sort、download zip、theme switch、tag filter），不要被改動蓋過
