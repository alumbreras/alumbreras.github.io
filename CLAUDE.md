# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal website for Alberto Lumbreras, built with Jekyll and hosted on GitHub Pages. The site showcases research publications, talks, coaching services, and blog posts about AI, machine learning, and various technical topics.

## Development Commands

### Local Development
```bash
# Install Ruby dependencies (first time only)
npm run install
# or directly: bundle install

# Run the development server (accessible at http://localhost:4000)
npm start
# or: npm run serve
# or directly: bundle exec jekyll serve

# Build the site (output in _site/)
npm run build
# or directly: bundle exec jekyll build
```

### Deployment to GitHub Pages
Deployment is **automatic** - GitHub Pages builds and deploys the site automatically when you push to the `master` branch. Simply:
1. Commit your changes: `git add . && git commit -m "your message"`
2. Push to GitHub: `git push origin master`
3. GitHub Pages will build and deploy automatically (takes 1-2 minutes)

No manual build or deployment steps are needed. The `_site/` directory is generated locally for preview but is not committed to the repository.

## Architecture

### Jekyll Structure

**Content Pages** (root and `_pages/`)
- `index.md`: Landing page with introduction and main content
- `_pages/research.md`: Research publications, talks, and posts listing
- `_pages/writing.md`: Writing index (main blog page), grouped by year
- `_pages/archive.md`: Past activities (coaching, archived posts), linked from the footer
- `_pages/coaching.md`: Archived coaching page (kept at its URL, linked from Archive)
- `_pages/*-redirect.md`, `_pages/posts.md`: redirects (jekyll-redirect-from) for moved pages

**Layouts** (`_layouts/`)
- `default.html`: Base layout with navbar, footer, and Bootstrap grid
- `post.html`: Layout for blog posts
- `talk.html`: Layout for talk pages with PDF links and abstracts

**Includes** (`_includes/`)
HTML snippets for reusable components:
- `navbar.html`: Navigation bar with links and Google Analytics tracking
- `head.html`: HTML head with meta tags, stylesheets
- `footer.html`: Footer section
- `scripts.html`: JavaScript includes

**Collections**
- `_posts/`: Blog posts (Markdown files with YAML front matter, dated format: YYYY-MM-DD-title.md)
- `_talks/`: Talk presentations with metadata (title, date, cover_image, pdf_link, abstract)

**Styling** (`_sass/`)
SCSS files for styling, including syntax highlighting themes (monokai, vim, zenburn, etc.)

### Configuration (`_config.yml`)

Key settings:
- Markdown: kramdown with GitHub Flavored Markdown (GFM)
- Syntax highlighting: rouge
- Collections: `talks` collection with permalink `/talks/:title/`
- Timezone: Europe/Berlin
- `safe: false` locally (allows plugins), but GitHub Pages uses `safe: true`

### Content Organization

**Writing**: The Writing page lists `_posts` (except those with `archived: true`) plus `_ai_notes` with `writing: true`, newest first (see `_includes/writing-items.html`). Optional front matter: `topic` (shown as a label) and `lang` (shown when not English). Posts support LaTeX math rendering and code syntax highlighting.

**AI Notes drafts**: Unfinished notes in `_ai_notes/` carry `published: false`. Keep them as drafts; do not delete them.

**Articles in progress are written in Obsidian**: while an article is being drafted, its source of truth is a `... (web).md` note in the work vault (`~/Vaults/work/30.05 ARTICULOS/<article folder>/`), with images in that folder's `img/`. Any change requested to the article must be made in the vault note, never only in the repo. "Upload" means copying the vault note into the repo (add layout/permalink front matter, map `img/` to `/assets/img/<slug>/`), checking on localhost, committing and pushing. Hidden review drafts live in `_pages/draft-*.md` with `noindex: true` and an unguessable permalink.

**Political/activist writing** does not belong here; it goes to maldekstrakolono.net (separate Jekyll repo `alumbreras/maldekstrakolono`, branch `gh-pages`).

**Talks**: Each talk is a Markdown file in `_talks/` with:
- `layout: talk`
- Metadata: title, date, cover_image, pdf_link, abstract
- The research.md page displays talks as a card grid sorted by date (most recent first)

**Research Page**: Manually maintained list of publications with links to PDFs, GitHub repos, and slides. Uses Font Awesome icons for visual indicators.

### Key Dependencies

- Jekyll (GitHub Pages compatible version)
- Bootstrap (for responsive grid and components)
- Font Awesome (for icons)
- Rouge (syntax highlighting)
- Kramdown (Markdown processor with math support)

## Important Notes

- The site uses Bootstrap for responsive design - navbar collapses on mobile
- Google Analytics tracking is embedded in navbar links via onclick events
- Math rendering in posts uses LaTeX/MathJax syntax
- The `_site/` directory is the build output and should not be edited directly
- Plugins (GitHub Pages whitelisted): jekyll-feed (`/feed.xml`), jekyll-seo-tag, jekyll-redirect-from
- Local builds on Ruby >= 3.2 fail with the Jekyll 3.9 pinned by `github-pages` (`tainted?` removed); use Ruby 3.1 or a shim
