# Documentation Agent Instructions

This repository is the **Game Creator 2 Community Documentation** GitBook space, synced with GitHub.

**Repo:** https://github.com/dragonzero39/GameCreator-2-Community-Documentation

## Before editing

1. Read `SUMMARY.md` — navigation structure and page hierarchy
2. Read `skill.md` — GitBook block syntax and formatting rules
3. Check `.gitbook.yaml` — root path and redirects
4. Read `CONTRIBUTING.md` — contributor safety and local GC2 reference setup
5. Read `DOCUMENTATION-STRUCTURE.md` — GitBook space layout and Visual Scripting catalog rules

## Read-local / write-public

Contributors inspect **their own licensed** GC2 Unity install locally. This repo publishes **knowledge only**.

| Read (local, never commit) | Write (this repo) |
|----------------------------|-------------------|
| `local.config.json` → `gc2UnityProjectPath` | Markdown pages, `SUMMARY.md`, `.gitbook/assets/` |
| GC2 plugin source under the contributor's Unity project | Short snippets, UI names, workflows |
| Unity project for fact-checking | No `.cs`, `.meta`, `.unity`, `.csproj`, or absolute paths |

- Copy `local.config.example.json` to `local.config.json` (gitignored) for local path configuration.
- Plugin install layout differs per contributor — do not assume a single standard path inside Unity.
- Optional: `gc2-docs.code-workspace.example` for multi-root Cursor/VS Code (personal copy is gitignored).

## Workflow

1. Create a feature branch for changes
2. Edit markdown content; update `SUMMARY.md` when adding, moving, or renaming pages
3. Run `scripts/validate-all.ps1` before committing
4. Commit and push; open a PR for review
5. Merge to `main` to sync changes to GitBook

## Do not

- Commit `local.config.json`, `gc2-docs.code-workspace`, or any Unity/GC2 plugin source
- Put absolute filesystem paths (`C:\`, `/Users/`, `/home/`) or `file://` URLs in markdown
- Reference the same markdown file twice in `SUMMARY.md`
- Create or edit the homepage README through the GitBook UI (Git Sync manages it in this repo)
- Embed OpenAPI JSON/YAML directly in markdown files
- Use tabs for indentation in `SUMMARY.md` (spaces only)
- Paste large proprietary source dumps into documentation pages

## Page structure in this repo

```
README.md                    # Homepage
SUMMARY.md                   # Table of contents
CONTRIBUTING.md                # Contributor guide (GitHub; not in GitBook nav)
DOCUMENTATION-STRUCTURE.md     # Space layout and VS catalog rules (GitHub; not in GitBook nav)
core-functionality/          # Audio, Saving, Variables
gc2-core-demos/
code/
visual-scripting/            # Triggers, Cameras, Signals
scripts/                     # validate-gitbook.ps1, validate-contributions.ps1
```
