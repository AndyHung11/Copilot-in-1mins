---
name: Store Weekly Operations Report Generator
description: Use when the user supplies weekly store operations data (weekly sales, traffic, average ticket, inventory turns, stock-outs, complaints, target achievement) and asks for a store operations weekly report, store-group performance report or weekly operations brief. Produces a visual HTML report plus a ready-to-send email summary.
---

# Store Weekly Operations Report Generator

## When to use

Trigger when the user provides weekly store operations data and asks for a "weekly operations report", "store weekly
report" or "weekly operations brief". Do not use this skill when the user only wants raw calculations or a pivot table.

## Outputs

Produce two files in one pass:

1. **Visual HTML report** (`Store_Weekly_Report_YYYY_Wxx.html`): a single file with inlined CSS and no external
   dependencies, openable directly in a browser or printable to PDF.
2. **Email summary** (`Store_Weekly_Report_Email_YYYY_Wxx.md`): a plain-text / light-HTML summary that can be pasted
   straight into an email, kept to roughly one screen.

## Calculation and interpretation rules

- Achievement rate = weekly sales / weekly target. If the source data already provides an achievement rate, use it
  as-is; do not recalculate.
- **Store tiers**: 105% or above is "Leading", 95%-105% "On plan", 85%-95% "Behind", below 85% "Severely behind".
- **Health check**: review average ticket, inventory turns, stock-outs and complaints together; flag any store below the
  chain average on two or more of these as "Needs attention".
- **Stock-out alert**: stores with 10 or more stock-outs always go into next week's priority actions.
- **Complaint alert**: stores with 5 or more complaints must be listed separately with a recommendation to investigate.
- Show percentages to one decimal place and amounts with thousands separators.

## HTML report structure (in order)

1. **Header**: week number, period covered, generation date.
2. **Summary cards**: chain total sales, total traffic, average ticket, overall achievement rate (four cards in a row).
3. **Store tiers**: four colored blocks for Leading / On plan / Behind / Severely behind, each listing store names and
   achievement rates.
4. **Store performance table**: all columns, with the achievement rate visualized as a bar, and severely-behind rows
   color-highlighted.
5. **Stores needing attention**: for each flagged store, state which two metrics fall below the chain average.
6. **Next week's priority actions**: sorted by impact, each naming the store and a recommended action.

### HTML style requirements

- Use a system font stack, with Microsoft JhengHei first for Chinese.
- Primary color `#8A3A62`; Leading `#2E7D5B`, Behind `#B4551B`, Severely behind `#A4373A`.
- Use light-grey borders and rounded corners for cards and tables; avoid heavy decoration.
- Must be a single HTML file with CSS inlined in `<style>`, referencing no external CDN or font links.

## Email summary structure

- Suggested subject: `[Store Weekly Report] YYYY Week xx - Overall achievement xx.x%`
- Open with a one-line summary of overall performance.
- Three key lines: best-performing store, store needing the most attention, and the single most urgent issue.
- One compact table: store and achievement rate only.
- Close with a line pointing to the full HTML report attached.

## Tone requirements

- The reader is an operations manager: be direct, avoid embellishment, and tie every conclusion to a specific number.
- Never use unsupported adjectives such as "outstanding" or "needs improvement" without a figure behind them.
- If a store's numbers look anomalous but the source data does not explain why, write "cause to be confirmed" rather
  than speculating.

## Cautions

- Do not introduce numbers that are not in the source data, and never invent a trend for visual effect.
- If a field is missing from the source data, state "not provided this week" explicitly rather than leaving it blank
  or filling in 0.
