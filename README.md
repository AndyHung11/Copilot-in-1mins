# Copilot 一分鐘小教室 / Copilot in 1 Minute

每週精選的 **Power of Copilot** 教學整理，涵蓋 Agent 與 Prompt。每篇都同時提供中／英兩個語言、v1／v2 兩種版面。

A curated archive of weekly **Power of Copilot** tips — Agents and Prompts. Every entry ships in both Chinese (繁中) and English, and in two layout versions (v1 / v2).

🔗 **公開網址 / Public site**：https://andyhung11.github.io/Copilot-in-1mins/
📚 **本地索引 / Local browser**：[index.html](./index.html) — 右上角 中／EN 切換語言 / use the top-right 中 / EN toggle
📦 **整包下載 / Download everything**：[PowerOfCopilot.zip](./PowerOfCopilot.zip) — 每次 push 都會重新打包 / fresh zip rebuilt on every push

---

## 目錄結構 / Folder structure

```
zh/
  v1/Agent/   A###_{Name}.html       v1 模板（繁中）/ v1 template (Chinese)
  v1/Agent/msg/                      Outlook .msg 草稿 / .msg drafts
  v1/Prompt/  P###_{Name}.html
  v1/Prompt/msg/
  v2/Agent/   A###_{Name}.html       v2 模板（繁中）/ v2 template (Chinese)
  v2/Agent/msg/
  v2/Prompt/  P###_{Name}.html
  v2/Prompt/msg/

en/
  v1/Agent/   A###_{Name}_EN.html    v1 template (English)
  v1/Agent/msg/
  v1/Prompt/  P###_{Name}_EN.html
  v1/Prompt/msg/
  v2/Agent/   A###_{Name}_EN.html    v2 template (English)
  v2/Agent/msg/
  v2/Prompt/  P###_{Name}_EN.html
  v2/Prompt/msg/

_sources/         A###.json / P###.json — 每篇文章的唯一資料來源 / single source of truth per entry
index.html        本地索引（含 中/EN 切換 + 整包下載按鈕）/ Local browser with 中/EN toggle and zip download
PowerOfCopilot.zip
_catalog_index.json
rebuild-index.ps1
pack-zip.ps1
```

中英版本完全對稱：同一個 `seq` 在 `zh/` 與 `en/` 底下都會存在，v1/v2 也相同。檔名差別只在英文版有 `_EN` 後綴。

Chinese and English mirror each other: every entry exists under `zh/` and `en/` with the same `seq` and the same v1/v2 split. The only filename difference is the `_EN` suffix on the English HTML and `.msg` files.

---

## 版本 / Versions

- **v1** — 原版單欄排版，較緊湊，接近原始 Email 樣式。
  Original single-column layout. Tighter, closer to the original email format.
- **v2** — 雙欄 Hero 加上 pain-points、what-section、quick-start，視覺更行銷導向。
  Refreshed two-column hero with pain-points, what-section, and quick-start. More marketing-friendly.

內容相同，依對象選擇即可。Same content; pick the version that fits the audience.

---

## 工作流程 / Workflow

每篇都從 `_sources/<Kind>/<seq>.json` 透過 `render.ps1`（位於 `copilot-newsletter-v2` skill）渲染而成，一次產出 **4 個 HTML**（中/英 × v1/v2）與對應的 **4 個 `.msg`**。

Pages are generated from `_sources/<Kind>/<seq>.json` via `render.ps1` (in the `copilot-newsletter-v2` skill). Each source file produces **4 HTML files** (zh + en × v1 + v2) and **4 matching `.msg` files**.

產完之後 `rebuild-index.ps1` 會做兩件事 / After generation, `rebuild-index.ps1` does two things:

1. 重建 `_catalog_index.json`（含中文 `file` 與英文 `en_file`），並更新 `index.html` 內嵌的 catalog。
   Refreshes `_catalog_index.json` (with `file` for Chinese and `en_file` for English) and updates the inline catalog in `index.html`.
2. 呼叫 `pack-zip.ps1`，把 `zh/`、`en/`、`index.html`、README 一起壓成 `PowerOfCopilot.zip`。
   Calls `pack-zip.ps1` to bundle `zh/`, `en/`, `index.html`, and the README into `PowerOfCopilot.zip`.

---

## 發布 / Publishing

- **主要通道 / Primary**：GitHub Pages — 從本 repo push 上去，網址同上。Pushed from this repo, served at the public URL above.
- **備份 / Backups**：`C:\Users\chhung\OneDrive - Microsoft\CopilotOfWeek\` 與 TAI SharePoint 的 `Copilot Family\Promotion\PowerofCopilot\`.

完整自動化流程在 Clawpilot skill `copilot-newsletter-v2`。
Full automation lives in the Clawpilot skill `copilot-newsletter-v2`.
