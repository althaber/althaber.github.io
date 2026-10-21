# Updating the website

This site is built with [Hugo](https://gohugo.io) and published by GitHub Pages
whenever changes are pushed to the `main` branch. You can edit files directly on
GitHub, or ask an AI assistant (Claude Code, Cursor, …) to do it for you.

**Every push to `main` goes live within a few minutes.** Preview first if unsure.

## Preview on your own computer

Run `preview.ps1` (right-click → "Run with PowerShell"), then open
<http://localhost:1414>. Only you can see this. Stop it with Ctrl+C.

## Common edits

| What | Where |
|------|-------|
| Name, position, institution, location | `hugo.yaml` → `params` |
| ORCID / Google Scholar / LinkedIn … links | `hugo.yaml` → `params.social` (paste the URL between the quotes) |
| "About me" text | `content/_index.md` |
| Research interests | `data/research_areas.yaml` |
| Talks | `data/talks.yaml` |
| CV sections | `data/cv.yaml` |
| Teaching | `content/teaching.md` |
| Contact | `content/contact.md` |
| Photo | replace `static/images/profile.jpg` (square, about 720×720 px) |

### Add a publication

1. Create a new folder in `content/publication/`, e.g.
   `content/publication/althaber-2027-short-title/`. The folder name becomes the
   web address – don't rename it later.
2. Inside it, create `index.md` (copy one of the existing ones) and fill in:

```yaml
---
title: "Paper title"
date: 2027-01-01
authors: ["Althaber, A.", "Co-Author, B."]
publication_types: ["journal_article"]   # journal_article | book | book_chapter | report
publication: "*Journal Name*, 12(3), 45–67"
areas: [wealth, gender]                  # keys from data/research_areas.yaml
links:
  - name: "Publisher's Version"
    url: "https://doi.org/..."
---
```

For work in progress add `status: "under review"` (or `"in preparation"`) – it
then appears under *Work in Progress* instead of a year.

To host a PDF, put it in `static/files/` and link it as `url: "files/name.pdf"`
(no leading slash).

### Offer the CV as a download

Put the PDF in `static/files/` and uncomment the `cv_pdf:` line in `content/cv.md`.
Check it for private details (private phone number, address) first – everything in
this repository is public.

## Before the first publication

- Fill in the "About me" text and the profile links.
- Set `show_placeholder_links: false` in `hugo.yaml` (hides links without a URL).
- On GitHub: *Settings → Pages → Build and deployment → Source: GitHub Actions*.

## If something goes wrong

Open the repository on GitHub → **Actions**. A red ✗ means the build failed; the
log shows why. Every change is versioned, so any edit can be undone.
