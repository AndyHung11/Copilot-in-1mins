<#
.SYNOPSIS
  Render a Copilot newsletter HTML file from a source JSON + strings dictionary.

.DESCRIPTION
  Reads a source JSON article file and strings.json language dictionary, substitutes
  all {{TOKEN}} placeholders in the matching template, and writes the rendered HTML.

  Token resolution priority (highest wins):
    1. Computed tokens (DOC_TITLE, ISSUE_DISPLAY, TITLE_MAIN, LICENSE_BADGE, etc.)
    2. Lang-specific source fields  (headline_zh -> HEADLINE when Lang=zh)
    3. Non-lang source fields (seq -> SEQ)
    4. strings.json[Lang] labels

  Alt-language fields are also exposed as ALT_* tokens:
    example_en_html -> ALT_EXAMPLE_HTML  (when Lang=zh)

.PARAMETER Source
  Path to the article source JSON file (e.g. sample_source_agent.json).

.PARAMETER Lang
  Language to render: zh, zh-cn, or en.

.PARAMETER OutDir
  Directory to write the rendered HTML into. Created if it does not exist.

.PARAMETER Version
  Template version to use: v1 (default) or v2.

.PARAMETER OutFile
  Optional: override the output filename (without path). If omitted, defaults to
  {SEQ}_{EnameSlug}_{Lang}.html  e.g. A001_ExecNewsAggregator_zh.html

.EXAMPLE
  .\render.ps1 -Source sample_source_agent.json -Lang zh -OutDir C:\temp\render
  .\render.ps1 -Source sample_source_prompt.json -Lang en -OutDir C:\temp\render -Version v2
#>
param(
    [Parameter(Mandatory=$true)][string]$Source,
    [Parameter(Mandatory=$true)][ValidateSet("zh","zh-cn","en")][string]$Lang,
    [Parameter(Mandatory=$true)][string]$OutDir,
    [ValidateSet("v1","v2")][string]$Version = "v1",
    [string]$OutFile = ""
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# ── Load inputs ──────────────────────────────────────────────────────────────
$srcPath     = Resolve-Path $Source
$src         = [System.IO.File]::ReadAllText($srcPath, [System.Text.Encoding]::UTF8) | ConvertFrom-Json

$stringsPath = Join-Path $scriptDir "strings.json"
$stringsAll  = [System.IO.File]::ReadAllText($stringsPath, [System.Text.Encoding]::UTF8) | ConvertFrom-Json
$langStr     = $stringsAll.PSObject.Properties[$Lang].Value

$kind        = "$($src.kind)"     # "agent" | "prompt"
$fieldLang   = if ($Lang -eq "zh-cn") { "zh_cn" } else { $Lang }
$altLang     = if ($Lang -eq "en") { "zh" } else { "en" }
$altFieldLang = if ($altLang -eq "zh-cn") { "zh_cn" } else { $altLang }

$templatePath = Join-Path $scriptDir "templates\${kind}_${Version}.html"
if (-not (Test-Path $templatePath)) {
    Write-Error "Template not found: $templatePath"
    exit 1
}
$html = [System.IO.File]::ReadAllText($templatePath, [System.Text.Encoding]::UTF8)

# ── Build token map ───────────────────────────────────────────────────────────
# Ordered dict; later keys overwrite earlier ones, so add lowest-priority first.
$T = [System.Collections.Specialized.OrderedDictionary]::new()

# 1. Strings for this language (lowest priority)
foreach ($p in $langStr.PSObject.Properties) {
    $T[$p.Name] = "$($p.Value)"
}

# 2. Non-lang source scalar fields  (seq -> SEQ, kind -> KIND, etc.)
foreach ($p in $src.PSObject.Properties) {
    $n = $p.Name
    if ($n -notmatch "_(zh_cn|zh|en)(_html)?$") {
        $T[$n.ToUpper()] = "$($p.Value)"
    }
}

# 3. Lang-specific source fields
#    name_zh       -> TOKEN       (when Lang=zh)
#    name_zh_cn    -> TOKEN       (when Lang=zh-cn)
#    name_en       -> TOKEN       (when Lang=en)
#    name_zh_html  -> TOKEN_HTML  (when Lang=zh)
#    name_en_html  -> TOKEN_HTML  (when Lang=en)
#    Also expose the OTHER language as ALT_TOKEN / ALT_TOKEN_HTML
foreach ($p in $src.PSObject.Properties) {
    $n   = $p.Name
    $val = "$($p.Value)"
    if ($n -match "^(.+)_(zh_cn|zh|en)_html$") {
        $base = $Matches[1].ToUpper()
        $fl   = $Matches[2]
        if ($fl -eq $fieldLang)    { $T["${base}_HTML"]     = $val }
        if ($fl -eq $altFieldLang) { $T["ALT_${base}_HTML"] = $val }
    } elseif ($n -match "^(.+)_(zh_cn|zh|en)$") {
        $base = $Matches[1].ToUpper()
        $fl   = $Matches[2]
        if ($fl -eq $fieldLang)    { $T[$base]       = $val }
        if ($fl -eq $altFieldLang) { $T["ALT_$base"] = $val }
    }
}

# 4. Computed tokens (highest priority — overwrite anything above)
$seq   = "$($src.seq)"
$emoji = "$($src.emoji)"
$cnameField = "cname_$fieldLang"
$cname = if ($src.PSObject.Properties.Name -contains $cnameField -and "$($src.$cnameField)" -ne "") { "$($src.$cnameField)" } else { "$($src.cname)" }
$ename = "$($src.ename)"

$T["LANG_ATTR"] = if ($Lang -eq "zh") { "zh-Hant" } elseif ($Lang -eq "zh-cn") { "zh-Hans-CN" } else { "en" }

$T["ISSUE_DISPLAY"] = if ($Lang -eq "en") { "Issue #$seq" } else { "第 $seq 期" }

$seriesWord = if ($kind -eq "agent") { "Agent" } else { "Prompt" }
if ($Lang -eq "zh") {
    $T["DOC_TITLE"]  = "Copilot 一分鐘小教室：Power of $seriesWord #$seq — $cname"
    $T["TITLE_MAIN"] = "$emoji $cname"
    $T["TITLE_ALT"]  = $ename
} elseif ($Lang -eq "zh-cn") {
    $T["DOC_TITLE"]  = "Copilot 一分钟小课堂：Power of $seriesWord #$seq — $cname"
    $T["TITLE_MAIN"] = "$emoji $cname"
    $T["TITLE_ALT"]  = $ename
} else {
    $T["DOC_TITLE"]  = "Copilot 1-Min Tips: Power of $seriesWord #$seq — $ename"
    $T["TITLE_MAIN"] = "$emoji $ename"
    # Do not show Chinese cname as subtitle in EN hero — leave TITLE_ALT blank
    $T["TITLE_ALT"]  = ""
}

# Kind-specific string selections
$T["BRAND_SERIES"]     = if ($kind -eq "agent") { $langStr.BRAND_SERIES_AGENT }     else { $langStr.BRAND_SERIES_PROMPT }
$T["THIS_ISSUE_LABEL"] = if ($kind -eq "agent") { $langStr.THIS_ISSUE_LABEL_AGENT } else { $langStr.THIS_ISSUE_LABEL_PROMPT }
$T["FOOTER_BRAND"]     = if ($kind -eq "agent") { $langStr.FOOTER_BRAND_AGENT }     else { $langStr.FOOTER_BRAND_PROMPT }

# Footer "powered by" — choose by source.
#   Priority: source.footer_powered (raw override) > FOOTER_POWERED_<SOURCE> in strings > FOOTER_POWERED (default)
$srcSource = "$($src.source)"
$srcFooterRaw = "$($src.footer_powered)"
if ($srcFooterRaw -ne "") {
    $T["FOOTER_POWERED"] = $srcFooterRaw
} elseif ($srcSource -ne "") {
    $footerKey = "FOOTER_POWERED_" + $srcSource.ToUpper()
    if ($langStr.PSObject.Properties.Name -contains $footerKey) {
        $T["FOOTER_POWERED"] = "$($langStr.$footerKey)"
    }
}
$T["INTRO_HTML"]       = if ($kind -eq "agent") { $langStr.INTRO_AGENT }            else { $langStr.INTRO_PROMPT }

$T["PAIN_POINTS_HEADING"] = if ($kind -eq "agent") { $langStr.PAIN_POINTS_HEADING_AGENT } else { $langStr.PAIN_POINTS_HEADING_PROMPT }
$T["WHAT_SECTION_LABEL"]  = if ($kind -eq "agent") { $langStr.WHAT_SECTION_LABEL_AGENT }  else { $langStr.WHAT_SECTION_LABEL_PROMPT }

# CTA
$T["CTA_URL"]   = if ($kind -eq "agent") { "https://m365.cloud.microsoft/chat/agent/new" } else { "https://m365.cloud.microsoft/chat" }
$T["CTA_LABEL"] = if ($kind -eq "agent") { $langStr.CTA_BUILD_AGENT } else { $langStr.CTA_TRY_CHAT }

# License badge text
$license = "$($src.license)"
$T["LICENSE_BADGE"] = if ($license -eq "required") { $langStr.LICENSE_BADGE_REQUIRED } else { $langStr.LICENSE_BADGE_FREE }

# License note (v2 footer) — allow per-entry override via license_note_zh / license_note_en
$noteOverride = $src."license_note_$fieldLang"
if ($noteOverride) {
    $T["LICENSE_NOTE"] = $noteOverride
} elseif ($kind -eq "agent") {
    $T["LICENSE_NOTE"] = if ($license -eq "required") { $langStr.LICENSE_NOTE_REQUIRED_AGENT } else { $langStr.LICENSE_NOTE_FREE_AGENT }
} else {
    $T["LICENSE_NOTE"] = if ($license -eq "required") { $langStr.LICENSE_NOTE_REQUIRED_PROMPT } else { $langStr.LICENSE_NOTE_FREE_PROMPT }
}

# Hero time badge (v2)
$T["HERO_TIME_BADGE"] = if ($kind -eq "agent") { $langStr.HERO_TIME_BADGE_AGENT } else { $langStr.HERO_TIME_BADGE_PROMPT }

# CTA heading: prefer source field, fall back to strings default
if (-not $T.Contains("CTA_HEADING") -or $T["CTA_HEADING"] -eq "") {
    $T["CTA_HEADING"] = $langStr.CTA_HEADING_DEFAULT
}

# v2 Prompt: TIPS_HTML is resolved from TIPS_LIST field (numbered) rather than plain TIPS.
# Keep v1 on the simple tips_*_html field; v1 wraps TIPS_HTML inside one td, so raw
# table rows from tips_list_*_html break Classic Outlook layout.
if ($Version -eq "v2" -and $T.Contains("TIPS_LIST_HTML") -and $T["TIPS_LIST_HTML"] -ne "") {
    $T["TIPS_HTML"] = $T["TIPS_LIST_HTML"]
}

# ── Validation: paired-language field asymmetry ──────────────────────────────
# Catches the silent-failure class where one language's field is filled but its
# counterpart is empty (e.g. story_en_html present, story_zh_html blank → the v1
# zh story section renders empty). Such empty tokens substitute to "" WITHOUT
# triggering the {{MISSING:...}} flag below, so they would otherwise vanish
# unnoticed. Non-fatal: emits a warning per offending field so QA can spot it.
$pairMap = @{}
foreach ($p in $src.PSObject.Properties) {
    if ($p.Name -match '^(.+)_(zh_cn|zh|en)(_html)?$') {
        $pbase = $Matches[1]; $plang = $Matches[2]; $phtml = $Matches[3]
        $key = "$pbase$phtml"
        if (-not $pairMap.Contains($key)) { $pairMap[$key] = @{} }
        $pairMap[$key][$plang] = "$($p.Value)"
    }
}
foreach ($key in $pairMap.Keys) {
    if (-not ($pairMap[$key].Contains('zh') -and $pairMap[$key].Contains('en'))) { continue }
    $zhEmpty = [string]::IsNullOrWhiteSpace($pairMap[$key]['zh'])
    $enEmpty = [string]::IsNullOrWhiteSpace($pairMap[$key]['en'])
    if ($zhEmpty -ne $enEmpty) {
        $blank  = if ($zhEmpty) { 'zh' } else { 'en' }
        $filled = if ($zhEmpty) { 'en' } else { 'zh' }
        Write-Warning ("[$seq] '${key}_${filled}' is filled but '${key}_${blank}' is EMPTY -> the $blank render silently drops this content. Fill both languages in the source JSON.")
    }
}

# ── Token substitution ────────────────────────────────────────────────────────
$result = $html

# Sort keys by descending length to prevent short key from replacing part of a longer key
$sortedKeys = $T.Keys | Sort-Object { $_.Length } -Descending

foreach ($k in $sortedKeys) {
    $v = $T[$k]
    if ($null -eq $v) { $v = "" }
    $result = $result.Replace("{{$k}}", $v)
}

# Flag any remaining unreplaced tokens so they're visible in QA
$result = [System.Text.RegularExpressions.Regex]::Replace(
    $result,
    '\{\{([A-Z][A-Z0-9_]*)\}\}',
    '{{MISSING:$1}}'
)

# ── Write output ──────────────────────────────────────────────────────────────
$null = New-Item -ItemType Directory -Force -Path $OutDir

if ($OutFile -eq "") {
    $slug    = $ename -replace '[^a-zA-Z0-9 ]', '' -replace '\s+', ''
    $OutFile = "${seq}_${slug}_${Lang}.html"
}

$outPath = Join-Path $OutDir $OutFile

# Write UTF-8 with BOM for maximum browser/Outlook compatibility
$enc = New-Object System.Text.UTF8Encoding($true)
[System.IO.File]::WriteAllText($outPath, $result, $enc)

Write-Host "Rendered: $outPath" -ForegroundColor Green
