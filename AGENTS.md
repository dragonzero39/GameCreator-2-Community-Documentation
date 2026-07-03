# Documentation Agent Instructions

This repository is the **Game Creator 2 Community Documentation** GitBook space, synced with GitHub.

**Repo:** https://github.com/dragonzero39/GameCreator-2-Community-Documentation

## Before editing

1. Read `SUMMARY.md` — navigation structure and page hierarchy
2. Read `skill.md` — GitBook block syntax and formatting rules
3. Check `.gitbook.yaml` — root path and redirects

## Workflow

1. Create a feature branch for changes
2. Edit markdown content; update `SUMMARY.md` when adding, moving, or renaming pages
3. Run `scripts/validate-gitbook.ps1` to check custom block tags
4. Commit and push; open a PR for review
5. Merge to `main` to sync changes to GitBook

## Do not

- Reference the same markdown file twice in `SUMMARY.md`
- Create or edit the homepage README through the GitBook UI (Git Sync manages it in this repo)
- Embed OpenAPI JSON/YAML directly in markdown files
- Use tabs for indentation in `SUMMARY.md` (spaces only)

## Page structure in this repo

```
README.md                    # Homepage
SUMMARY.md                   # Table of contents
core-functionality/          # Audio, Saving, Variables
gc2-core-demos/
code/
visual-scripting/            # Triggers, Cameras, Signals
```
