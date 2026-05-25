# Copilot in 1 Minute

> 🌐 **Languages**: **English** · [繁體中文](./README.zh.md)

A curated archive of weekly **Power of Copilot** tips — Agents and Prompts. Every entry ships in both Chinese (繁中) and English, and in two layout versions (v1 / v2).

🔗 **Public site**: https://andyhung11.github.io/Copilot-in-1mins/
📚 **Local browser**: [index.html](./index.html) — switch language with the top-right 中 / EN toggle
📦 **Download everything**: [PowerOfCopilot.zip](./PowerOfCopilot.zip) — fresh zip rebuilt on every push

## Folder structure

```
zh/
  v1/Agent/   A###_{Name}.html       v1 template (Chinese)
  v1/Agent/msg/                      .msg drafts
  v1/Prompt/  P###_{Name}.html
  v1/Prompt/msg/
  v2/Agent/   A###_{Name}.html       v2 template (Chinese)
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

_sources/         A###.json / P###.json — single source of truth per entry
index.html        Local browser with 中/EN toggle and zip download
PowerOfCopilot.zip
_catalog_index.json
rebuild-index.ps1
pack-zip.ps1
```

Chinese and English mirror each other: every entry exists under `zh/` and `en/` with the same `seq` and the same v1/v2 split. The only filename difference is the `_EN` suffix on the English HTML and `.msg` files.

## Versions

- **v1** — original single-column layout. Tighter, closer to the original email format.
- **v2** — refreshed two-column hero with pain-points, what-section, and quick-start. More marketing-friendly.

Same content; pick the version that fits the audience.

## Workflow

Pages are generated from `_sources/<Kind>/<seq>.json` via `render.ps1` (in the `copilot-newsletter-v2` skill). Each source file produces **4 HTML files** (zh + en × v1 + v2) and **4 matching `.msg` files**.

After generation, `rebuild-index.ps1` does two things:

1. Refreshes `_catalog_index.json` (with `file` for Chinese and `en_file` for English) and updates the inline catalog in `index.html`.
2. Calls `pack-zip.ps1` to bundle `zh/`, `en/`, `index.html`, and both README files into `PowerOfCopilot.zip`.

## Publishing

- **Primary**: GitHub Pages — pushed from this repo, served at the public URL above.
- **Backups**: `C:\Users\chhung\OneDrive - Microsoft\CopilotOfWeek\` and the TAI SharePoint copy under `Copilot Family\Promotion\PowerofCopilot\`.

Full automation lives in the Clawpilot skill `copilot-newsletter-v2`.
