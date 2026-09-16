"""Give every tracked page the Copilot logo as its tab icon.

portal.html was the only page declaring an icon, so everything else fell back
to the browser's generic globe. The tag is inlined as a data URI rather than
pointing at copilot-logo.png: the handbooks, playbooks, galleries and
newsletters are all distributed as standalone files, and a relative href stops
resolving the moment a reader saves one somewhere else.

Idempotent: re-run after any rebuild to put back a tag the generator dropped.

Usage:
    python _tools/add_favicon.py [--check] [--include-edm]

    --check         report what is missing without writing anything
    --include-edm   also cover the per-issue newsletters under zh|en|zh-cn
"""

import base64
import io
import os
import re
import subprocess
import sys

from PIL import Image

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SOURCE_LOGO = os.path.join(REPO, "copilot-logo.png")
ICON_PX = 48

MARKER = "<!-- FAVICON v1 -->"
TAG_RE = re.compile(r"[ \t]*<!-- FAVICON v1 -->\r?\n[ \t]*<link rel=\"icon\"[^>]*>[ \t]*\r?\n")
ICON_LINK_RE = re.compile(r"[ \t]*<link[^>]*rel=\"?icon[^>]*>[ \t]*\r?\n", re.I)
# Anchors in priority order. Most pages open with <meta charset>, but the
# newsletters are XHTML email templates that use http-equiv instead.
ANCHORS = (
    re.compile(r"([ \t]*<meta charset=[^>]*>[ \t]*\r?\n)", re.I),
    re.compile(r"([ \t]*<meta http-equiv=\"Content-Type\"[^>]*>[ \t]*\r?\n)", re.I),
    re.compile(r"([ \t]*<head[^>]*>[ \t]*\r?\n)", re.I),
)

EDM_DIR_RE = re.compile(r"^(zh|en|zh-cn)/v[12]/")
# Not published as pages: internal render samples, and the newsletter templates
# the generator stamps out (those are covered when the newsletters are).
SKIP_PREFIXES = ("_sample_render/", "_tools/", "CopilotinWord/")


def favicon_tag():
    im = Image.open(SOURCE_LOGO).convert("RGBA").resize((ICON_PX, ICON_PX), Image.LANCZOS)
    buf = io.BytesIO()
    im.save(buf, "PNG", optimize=True)
    uri = "data:image/png;base64," + base64.b64encode(buf.getvalue()).decode("ascii")
    return MARKER + "\n" + '<link rel="icon" type="image/png" sizes="any" href="' + uri + '" />\n'


def tracked_html(include_edm):
    out = subprocess.run(
        ["git", "ls-files", "*.html", "*.htm"],
        cwd=REPO, capture_output=True, text=True, check=True,
    ).stdout
    rels = [line.strip() for line in out.splitlines() if line.strip()]
    rels = [r for r in rels if not r.startswith(SKIP_PREFIXES)]
    if not include_edm:
        rels = [r for r in rels if not EDM_DIR_RE.match(r)]
    return rels


def process(check_only, include_edm):
    tag = favicon_tag()
    changed, missing, skipped = 0, 0, []

    for rel in tracked_html(include_edm):
        path = os.path.join(REPO, rel.replace("/", os.sep))
        raw = open(path, "rb").read()
        bom = raw.startswith(b"\xef\xbb\xbf")
        text = raw.decode("utf-8-sig" if bom else "utf-8")

        if check_only:
            if MARKER not in text:
                missing += 1
                print("   missing:", rel)
            continue

        stripped = ICON_LINK_RE.sub("", TAG_RE.sub("", text))
        for anchor in ANCHORS:
            updated, n = anchor.subn(lambda m: m.group(1) + tag, stripped, count=1)
            if n:
                break
        else:
            n = 0
        if not n:
            skipped.append("[NO ANCHOR] " + rel)
            continue
        if updated == text:
            continue

        data = updated.encode("utf-8")
        open(path, "wb").write(b"\xef\xbb\xbf" + data if bom else data)
        changed += 1

    total = len(tracked_html(include_edm))
    if check_only:
        print(f"favicon: {total - missing}/{total} pages carry the tag")
    else:
        print(f"favicon: {changed} changed, {total} pages considered")
    for item in skipped:
        print("  ", item)
    return missing if check_only else 0


if __name__ == "__main__":
    flags = sys.argv[1:]
    sys.exit(1 if process("--check" in flags, "--include-edm" in flags) else 0)