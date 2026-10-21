# Website principles (for future maintenance, human or AI)

Built following the GaryKing.org/mysite instructions, adapted:

- **Hugo without a theme.** All layouts live in `layouts/`; there is no Hugo Blox
  dependency, no Go modules and no `_vendor/` folder. This keeps the build to a
  single binary and makes every template easy to find. Inspired by nkapelle.github.io
  but deliberately different: top bar with the name; homepage with name and
  "About me" on the left and a portrait (4:5, `static/images/profile-portrait.jpg`)
  plus profile links on the right; subpages full width without a sidebar.
  Profile links come from `params.social` via `layouts/partials/profile-links.html`
  (also on the Contact page through the `profile-links` shortcode).
- **Search:** Pagefind, built after Hugo (`npx pagefind --site public`), loaded only
  when the search modal opens (Ctrl/Cmd-K). Falls back to a Google `site:` search.
- **Content model:** publications are page bundles in `content/publication/<slug>/index.md`;
  the folder name is the permanent URL. Talks, CV and research areas are YAML in `data/`.
- **Publications page:** deliberately plain (owner's choice, like the reference site):
  one heading per type (journal articles, books and chapters, other, work in progress),
  newest first, no filters or JS. Grouping comes from `layouts/partials/tab-for.html`.
- **See also:** computed at build time in `layouts/partials/related.html`
  (explicit `related:` slugs, then shared areas / co-authors / title words).
- **Metadata:** `citation_*` tags and JSON-LD on publication pages; Person JSON-LD
  and the mysite generator meta tag on the homepage (both gated by
  `params.mysite.discovery`); footer credit gated by `params.mysite.credit`.
  `robots.txt`, `sitemap.xml` and `static/llms.txt` welcome crawlers.
- **URLs:** user site at `https://althaber.github.io/` – `baseURL` in `hugo.yaml` is the
  single source; never derive it in CI. Use `relURL` without a leading slash in templates.
- **Tone:** factual, owner's own wording, no superlatives. No process notes on the
  public site – flags go in HTML comments only.
- **Colours:** tokens at the top of `assets/css/main.css`; deep green accent with LMU
  green (`--color-institution`) used sparingly for hovers. Always light mode.
