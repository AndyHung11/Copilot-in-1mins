# Copilot 一分鐘小教室

> 🌐 **語言**：**繁體中文** · [English](./README.md)

每週精選的 **Power of Copilot** 教學整理，涵蓋 Agent 與 Prompt。每篇都同時提供中／英兩個語言、v1／v2 兩種版面。

🔗 **公開網址**：https://andyhung11.github.io/Copilot-in-1mins/
📚 **本地索引**：[index.html](./index.html) — 右上角 中／EN 切換語言
📦 **整包下載**：[PowerOfCopilot.zip](./PowerOfCopilot.zip) — 每次 push 都會重新打包

## 目錄結構

```
zh/
  v1/Agent/   A###_{Name}.html       v1 模板（繁中）
  v1/Agent/msg/                      Outlook .msg 草稿
  v1/Prompt/  P###_{Name}.html
  v1/Prompt/msg/
  v2/Agent/   A###_{Name}.html       v2 模板（繁中）
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

_sources/         A###.json / P###.json — 每篇文章的唯一資料來源
index.html        本地索引（含 中/EN 切換 + 整包下載按鈕）
PowerOfCopilot.zip
_catalog_index.json
rebuild-index.ps1
pack-zip.ps1
```

中英版本完全對稱：同一個 `seq` 在 `zh/` 與 `en/` 底下都會存在，v1/v2 也相同。檔名差別只在英文版有 `_EN` 後綴。

## 版本

- **v1** — 原版單欄排版，較緊湊，接近原始 Email 樣式。
- **v2** — 雙欄 Hero 加上 pain-points、what-section、quick-start，視覺更行銷導向。

內容相同，依對象選擇即可。

## 工作流程

每篇都從 `_sources/<Kind>/<seq>.json` 透過 `render.ps1`（位於 `copilot-newsletter-v2` skill）渲染而成，一次產出 **4 個 HTML**（中/英 × v1/v2）與對應的 **4 個 `.msg`**。

產完之後 `rebuild-index.ps1` 會做兩件事：

1. 重建 `_catalog_index.json`（含中文 `file` 與英文 `en_file`），並更新 `index.html` 內嵌的 catalog。
2. 呼叫 `pack-zip.ps1`，把 `zh/`、`en/`、`index.html`、兩份 README 一起壓成 `PowerOfCopilot.zip`。

## 發布

- **主要通道**：GitHub Pages，從本 repo push 上去，網址同上。
- **備份**：`C:\Users\chhung\OneDrive - Microsoft\CopilotOfWeek\` 與 TAI SharePoint 的 `Copilot Family\Promotion\PowerofCopilot\`。

完整自動化流程在 Clawpilot skill `copilot-newsletter-v2`。
