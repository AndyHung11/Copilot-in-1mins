# Copilot 一分鐘小教室 / Copilot in 1 Minute

每週精選的 **Power of Copilot** 教學整理，涵蓋 Agent 與 Prompt。每篇都同時提供繁中／简中（中國本地化）／英文三個語言、v1／v2 兩種版面。

A curated archive of weekly **Power of Copilot** tips — Agents and Prompts. Every entry ships in three languages — Traditional Chinese (繁中), Simplified Chinese (简中, localized for Mainland China), and English — and in two layout versions (v1 / v2).

🔗 **公開網址 / Public site**：https://andyhung11.github.io/Copilot-in-1mins/

📚 **本地索引 / Local browser**：[index.html](./index.html)（經典版 / Classic）· [index_v2.html](./index_v2.html)（新版 / New）— 右上角 繁中／简中／EN 切換語言 / use the top-right 繁中 / 简中 / EN toggle

📦 **整包下載 / Download everything**：[PowerOfCopilot.zip](./PowerOfCopilot.zip)

---

## 目錄結構 / Folder structure

```
zh/     繁體中文 / Traditional Chinese
  v1/Agent/   A###_{Name}.html          v1 模板 / v1 template
  v1/Agent/eml/                         Outlook .eml 草稿 (X-Unsent) / .eml drafts
  v1/Prompt/  P###_{Name}.html
  v1/Prompt/eml/
  v2/Agent/   A###_{Name}.html          v2 模板 / v2 template
  v2/Prompt/  P###_{Name}.html
  (每個 Agent/Prompt 目錄底下都有對應 eml/ 子目錄)

zh-cn/  简体中文（中國本地化）/ Simplified Chinese (Mainland-localized)
  v1|v2 / Agent|Prompt / A###_{Name}_CN.html + eml/

en/     英文 / English
  v1|v2 / Agent|Prompt / A###_{Name}_EN.html + eml/

index.html                經典索引（繁中/简中/EN 切換 + 全部下載）
                          Classic browser with 繁中/简中/EN toggle and zip download
index_v2.html             新版索引（主題切換 + 標籤篩選 + 卡片預覽）
                          New browser with theme switch, tag filter, card previews
PowerOfCopilot.zip        整包壓縮檔 / full archive
_catalog_index.json       索引資料 / catalog data
tag_map.json              場景標籤（任務／工具軸）/ scenario tags (task / tool axes)
```

三語版本完全對稱：同一個 `seq` 在 `zh/`、`zh-cn/`、`en/` 底下都會存在，v1/v2 也相同。檔名差別只在 `_CN`（简中）與 `_EN`（英文）後綴。

The three languages mirror each other: every entry exists under `zh/`, `zh-cn/`, and `en/` with the same `seq` and the same v1/v2 split. The only filename difference is the `_CN` (Simplified) and `_EN` (English) suffix.

---

## 版本 / Versions

- **v1** — 原版單欄排版，較緊湊，接近原始 Email 樣式。
  Original single-column layout. Tighter, closer to the original email format.
- **v2** — 雙欄 Hero 加上 pain-points、what-section、quick-start，視覺更行銷導向。
  Refreshed two-column hero with pain-points, what-section, and quick-start. More marketing-friendly.

內容相同，依對象選擇即可。Same content; pick the version that fits the audience.
