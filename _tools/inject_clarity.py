"""Re-apply the Microsoft Clarity tag to every tracked HTML page.

Idempotent: files that already carry the tag are left untouched, so this can be
run after any rebuild (handbook generators, Cowork Playbook, galleries) to put
back the tag that a regenerated page would otherwise drop.

Usage:
    python _tools/inject_clarity.py [repo_path ...] [--check]

    --check   report what is missing without writing anything
"""

import os
import re
import subprocess
import sys

PROJECT_ID = "x78imrd05u"
COMMENT = "<!-- Microsoft Clarity -->"
SCRIPT = (
    '<script type="text/javascript">(function(c,l,a,r,i,t,y){c[a]=c[a]||function()'
    '{(c[a].q=c[a].q||[]).push(arguments)};t=l.createElement(r);t.async=1;'
    't.src="https://www.clarity.ms/tag/"+i;y=l.getElementsByTagName(r)[0];'
    'y.parentNode.insertBefore(t,y);})(window,document,"clarity","script",'
    f'"{PROJECT_ID}");</script>'
)

# Pages whose Content-Security-Policy blocks external scripts and beacons.
SKIP = {"agent-builder/index.html"}


def tracked_html(repo):
    out = subprocess.run(
        ["git", "ls-files", "*.html", "*.htm"],
        cwd=repo, capture_output=True, text=True, check=True,
    ).stdout
    return [line.strip() for line in out.splitlines() if line.strip()]


def process(repo, check_only=False):
    injected, skipped = 0, []
    for rel in tracked_html(repo):
        if rel in SKIP:
            skipped.append(f"[CSP] {rel}")
            continue
        path = os.path.join(repo, rel.replace("/", os.sep))
        raw = open(path, "rb").read()
        bom = raw.startswith(b"\xef\xbb\xbf")
        text = raw.decode("utf-8-sig" if bom else "utf-8")
        if "clarity.ms/tag/" in text:
            continue
        head = re.search(r"</head>", text, re.I)
        if not head:
            skipped.append(f"[NO HEAD] {rel}")
            continue
        if check_only:
            injected += 1
            print("   missing:", rel)
            continue
        newline = "\r\n" if "\r\n" in text[: head.start()] else "\n"
        text = text[: head.start()] + COMMENT + newline + SCRIPT + newline + text[head.start():]
        data = text.encode("utf-8")
        open(path, "wb").write(b"\xef\xbb\xbf" + data if bom else data)
        injected += 1
    verb = "missing" if check_only else "injected"
    print(f"{os.path.basename(repo)}: {verb}={injected}")
    for item in skipped:
        print("  ", item)
    return injected


if __name__ == "__main__":
    args = [a for a in sys.argv[1:] if a != "--check"]
    check = "--check" in sys.argv[1:]
    repos = args or [os.path.dirname(os.path.dirname(os.path.abspath(__file__)))]
    total = sum(process(os.path.abspath(r), check) for r in repos)
    sys.exit(1 if (check and total) else 0)
