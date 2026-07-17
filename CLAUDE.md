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
- `_pages/coaching.md`: Coaching services information
- `_pages/posts.md`: Blog posts index

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

**Blog Posts**: Use Jekyll's standard post format with YAML front matter. Posts support LaTeX math rendering and code syntax highlighting.

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
- External links include an e-Garden (Obsidian Publish) and LinkedIn profile
