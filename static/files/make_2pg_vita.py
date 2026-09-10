#!/usr/bin/env python3
"""Condense content/vita.md + assets/includes/publications.md into a 2-page CV source.

Reads the same single-source-of-truth files used by the full CV, selects the most
recent / most relevant entries, and shortens them (last names only, title
hyperlinked to the DOI, no volume-page details) so the result fits two pages.

Tune the counts below if the PDF spills onto a third page.
"""

import re
import sys
from pathlib import Path

# --- how much of each section to keep -------------------------------------
N_PUBS = 18
N_GRANTS = 6
N_AWARDS = 5
N_SERVICE = 7
N_TALK_YEARS = 0  # invited talks are omitted from the short CV
MAX_AUTHORS = 3   # authors shown before "et al."

REPO = Path(__file__).resolve().parents[2]
PARTICLES = {"de", "van", "von", "der", "den", "del", "di", "da", "la", "le"}


def sections(md):
    """Split a markdown doc into {top-level heading: body} (frontmatter stripped)."""
    md = re.sub(r"\A---\n.*?\n---\n", "", md, flags=re.S)
    out, name, buf = {}, None, []
    for line in md.splitlines():
        m = re.match(r"^# +(.*)", line)
        if m:
            if name:
                out[name] = "\n".join(buf).strip()
            name, buf = m.group(1).strip(), []
        elif name:
            buf.append(line)
    if name:
        out[name] = "\n".join(buf).strip()
    return out


def bullets(text):
    """Return top-level '- ' bullets, each with continuation lines folded in."""
    items, cur = [], None
    for line in text.splitlines():
        if re.match(r"^- ", line):
            if cur:
                items.append(" ".join(cur.split()))
            cur = line[2:]
        elif cur is not None and line.strip():
            cur += " " + line.strip()
        elif cur is not None and not line.strip():
            items.append(" ".join(cur.split()))
            cur = None
    if cur:
        items.append(" ".join(cur.split()))
    return [i for i in items if i]


def unlink(s):
    """[text](url) -> text ; <url> -> url"""
    s = re.sub(r"\[([^\]]*)\]\([^)]*\)", r"\1", s)
    return re.sub(r"<(https?://[^>]*)>", r"\1", s)


def surname(author):
    """'Kari E. A. Norman' -> 'Norman'; '__Carl Boettiger__' -> '**Boettiger**'."""
    me = "__" in author or "**" in author
    a = author.replace("__", "").replace("**", "").strip().rstrip(",")
    toks = a.split()
    if not toks:
        return None
    last = toks[-1]
    if len(toks) > 1 and toks[-2].lower() in PARTICLES:
        last = toks[-2] + " " + last
    return f"**{last}**" if me else last


def short_authors(raw):
    """Compact an author string to surnames, keeping Boettiger visible."""
    truncated = bool(re.search(r"\bothers\b|\bet al\.", raw))
    raw = re.sub(r",? and ", ", ", raw)
    names = [n for n in (surname(x) for x in raw.split(",") if x.strip()) if n]
    names = [n for n in names if n.lower() not in ("others", "et al.")]
    if len(names) <= MAX_AUTHORS and not truncated:
        return ", ".join(names)
    head = names[:MAX_AUTHORS]
    tail = " et al."
    if not any("**" in n for n in head):
        head.append("... **Boettiger**")
    return ", ".join(head) + tail


def short_pub(entry):
    """'- 75\\. Authors (2026). Title. _Journal_ 1(2), 3-4. [doi:..](url)' -> one line."""
    entry = re.sub(r"^\d+\\?\.\s*", "", entry)
    m = re.search(r"\((\d{4})[a-z]?\)\.?", entry)
    if not m:
        return unlink(entry)
    authors, year, rest = entry[: m.start()], m.group(1), entry[m.end():].strip()

    doi = ""
    d = re.search(r"\]\((https?://doi\.org/[^)]+)\)", rest)
    if d:
        doi = d.group(1)
    rest = re.sub(r"\[doi:[^\]]*\]\([^)]*\)\.?", "", rest).strip()
    rest = unlink(rest).strip()

    journal = ""
    j = re.search(r"_([^_]+)_", rest)
    if j:
        journal = j.group(1).strip().rstrip(",.")
        title = rest[: j.start()].strip()
    else:
        title = rest
    title = title.strip().rstrip(".").strip()
    title = re.sub(r"\s+", " ", title)

    linked = f"[{title}]({doi})" if doi and title else title
    out = f"{short_authors(authors)} ({year}). {linked}."
    if journal:
        out += f" *{journal}*."
    return out


def trim_grant(g):
    g = unlink(g)
    g = re.sub(r"\s*(UCB (sub-)?[Aa]ward ID|Federal Award|award)[^.;]*[.;]", " ", g)
    g = re.sub(r"\s*\(proposal link\)", "", g)
    g = re.sub(r"\s*\.(\s*\.)+", ".", g)
    return re.sub(r"\s+", " ", g).strip()


def render(title, items):
    if not items:
        return ""
    body = "\n".join(f"- {i}" for i in items)
    return (f"# {title}\n\n{body}\n\n" if title else f"{body}\n\n")


def main():
    vita = sections((REPO / "content/vita.md").read_text())
    pubs_md = (REPO / "assets/includes/publications.md").read_text()

    out = []

    emp = [re.sub(r"\s*Mentors?:.*$", "", unlink(b)) for b in bullets(vita["Employment"])]
    out.append(render("Employment", emp))

    edu = [re.sub(r"\s*Mentors?:.*$", "", unlink(b)) for b in bullets(vita["Education"])]
    out.append(render("Education", edu))

    pubs = [short_pub(p) for p in bullets(pubs_md)[:N_PUBS]]
    total = len(bullets(pubs_md))
    out.append(f"# Selected Publications\n\n*{N_PUBS} of {total} peer-reviewed "
               "publications; full list at "
               "[carlboettiger.info/vita](https://carlboettiger.info/vita.html)*\n\n"
               + render("", pubs).lstrip("# \n"))

    out.append(render("Selected Grants",
                      [trim_grant(g) for g in bullets(vita["Grants"])[:N_GRANTS]]))

    out.append(render("Awards",
                      [unlink(a) for a in bullets(vita["Awards"])[:N_AWARDS]]))

    out.append(render("Teaching",
                      [unlink(t) for t in bullets(vita["Teaching"])]))

    svc = vita["Service & Outreach"]
    natl = svc.split("## National / International", 1)[-1]
    out.append(render("Selected Service",
                      [unlink(s) for s in bullets(natl)[:N_SERVICE]]))

    sys.stdout.write("".join(x for x in out if x))


if __name__ == "__main__":
    main()
