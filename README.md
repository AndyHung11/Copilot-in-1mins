# Copilot in 1 Minute (一分鐘小教室)

A curated archive of weekly "Power of Copilot" tips — Agents and Prompts. Each entry ships in both Chinese (繁中) and English, and in two layout versions (v1 / v2).

Browse the catalog: **[index.html](./index.html)** — or visit the public site at [andyhung11.github.io/Copilot-in-1mins](https://andyhung11.github.io/Copilot-in-1mins/).

## Folder structure

```
zh/
  v1/Agent/   A###_{Name}.html       v1 模板（繁中）
  v1/Agent/msg/                       .msg drafts
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

_sources/      A###.json / P###.json — single source of truth per entry
index.html     Local browser with 中/EN toggle
_catalog_index.json
rebuild-index.ps1
```

Chinese and English mirror each other: every entry exists under `zh/` and `en/` with the same `seq` and the same v1/v2 split. The only filename difference is the `_EN` suffix on the English HTML/.msg.

## Versions

- **v1** — original single-column layout. Tighter, closer to the original email format.
- **v2** — refreshed two-column hero with pain-points + what-section + quick-start. More marketing-friendly.

Same content; pick the version that fits the audience.

## Workflow

Pages are generated from `_sources/<Kind>/<seq>.json` via `templates/render.ps1` (in the `copilot-newsletter-v2` skill). Each source file produces 4 HTML files (zh + en × v1 + v2) and 4 matching `.msg` files. After generation, `rebuild-index.ps1` refreshes `_catalog_index.json` (which now includes both `file` and `en_file`) and updates the inline catalog in `index.html`.

## Publishing

- **Primary**: GitHub Pages — pushed from this repo, served at the public URL above.
- **Backups**: `C:\Users\chhung\OneDrive - Microsoft\CopilotOfWeek\` and the TAI SharePoint copy under `Copilot Family\Promotion\PowerofCopilot\`.

Full automation flow lives in the Clawpilot skill `copilot-newsletter-v2`.
