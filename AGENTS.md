# Repository Guidelines

## Project Structure & Module Organization

This site is a static export, so what you ship is exactly what GitHub Pages serves. `index.html` is the landing page, while `utdrag.html` and the directories named `*_files` hold shared assets that should stay in sync with their companion HTML files. Long-form articles live in `post/` (each article has an `.html` file plus a matching `_files/` asset bundle). Keep the existing folder names — they encode Wix export slugs and breaking them will orphan image/css references. `CNAME` pins the custom domain and must remain untouched. Use `reformater.sh` when editing HTML or CSS to keep the structure consistent.

## Build, Test, and Development Commands

- `python3 -m http.server 4000` — preview the site locally at `http://localhost:4000` to verify links and styling.
- `bash reformater.sh` — runs Prettier with the repo defaults across all HTML/CSS assets for consistent formatting.
- `npx prettier --check .` — CI-friendly verification that no files drift from the enforced format before pushing.

## Coding Style & Naming Conventions

HTML is indented with two spaces and relies on inline `<style>` blocks that Prettier will keep compact; avoid mixing tabs. Keep filenames lowercase with hyphens (`en-skikkelig-innertier.html`) to match existing links. When adding sections, follow the exported DOM patterns instead of introducing new frameworks, and keep CSS scoped to the relevant page to avoid clobbering global Wix classes. Reference assets through relative paths inside each `_files/` directory so GitHub Pages can resolve them without rewrites.

## Testing Guidelines

There is no automated test harness, so perform manual smoke tests on every change: load the home page and any modified article via the local server, click all links, and spot-check that large background images load. Use browser dev tools to watch for 404s in the network panel. If you add downloadable files, confirm their MIME types by serving locally. Document any known visual regressions in the PR to help reviewers verify.

## Commit & Pull Request Guidelines

Commits are short and descriptive (see `git log`: “Fjernet flere Wix-referanser”, “La til reformateringsskript”). Use the imperative mood, optionally in Norwegian, and limit yourself to one focused idea per commit. Pull requests should include: a plain-language summary of the change, before/after screenshots for visual tweaks, references to related issues or pages, and a note that `reformater.sh` and manual checks have been run. Flag any large asset additions so reviewers can double-check bandwidth impacts before merging.
