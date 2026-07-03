# Contributing to Game Creator 2 Community Documentation

This space is published on **GitBook** and synced with GitHub. You do **not** need to clone this repository to contribute — many contributors will edit directly in GitBook or use GitHub’s web editor. If you use Git Sync locally (Cursor, VS Code, CLI), clone only when that workflow suits you.

**What always stays private:** Game Creator 2 plugin source, your Unity project, and paths on your machine.

**What this project publishes:** Knowledge — guides, workflows, feature descriptions, and small illustrative examples.

**Documentation layout:** Each GC2 plugin space uses four sections — Core Functionality, Demos, Code, and **Visual Scripting** (highest priority). See [DOCUMENTATION-STRUCTURE.md](DOCUMENTATION-STRUCTURE.md) for the full structure guide, page templates, and Visual Scripting catalog rules.

---

## The read-local / write-public model

```
┌──────────────────────────────────────────┐
│  Public (GitBook + GitHub)               │
│  Markdown, images, navigation only       │
└──────────────────────────────────────────┘
                    ▲
                    │  contributions (sanitized)
                    │
┌──────────────────────────────────────────┐
│  Your machine (never committed)          │
│  local.config.json                       │
│  Licensed GC2 plugins + Unity project    │
└──────────────────────────────────────────┘
```

1. **Read** your local licensed GC2 install to verify accuracy.
2. **Write** only sanitized knowledge into GitBook / this repo.
3. **Never** commit plugin source, Unity project files, or absolute paths.

---

## Step 1: Access the documentation

Choose the workflow that fits you:

| Method | When to use |
|--------|-------------|
| **GitBook editor** | Quick edits, live preview, no git required |
| **GitHub web editor** | Small markdown fixes via the browser |
| **Git Sync (local clone)** | Batch edits, AI assistants, validation scripts |

The live site is the source of truth for readers. GitHub holds the synced markdown that GitBook publishes.

---

## Step 2: Set up your local GC2 reference (optional but recommended)

Accurate documentation requires access to **your own licensed** Game Creator 2 modules. How you install and lay out plugins is **up to you** — Asset Store import, manual package copy, multiple Unity projects, UPM, etc.

Common patterns contributors use:

- A dedicated Unity **“Knowledge Build”** project used only for research and screenshots
- GC2 modules imported into an existing game project
- Multiple projects with different module combinations

**Requirements:**

- You must own a valid license for any GC2 module you reference.
- Plugin source stays on your machine — **never** upload it to this repo.
- Do not assume other contributors have the same folder layout or module list.

---

## Step 3: Configure local paths (Git Sync / Cursor users)

If you edit locally or use AI tools that read your GC2 codebase:

1. Copy `local.config.example.json` to `local.config.json` in this repo’s root.
2. Set `gc2UnityProjectPath` to your Unity project folder.
3. List the GC2 modules you have in `installedModules`.
4. Confirm `local.config.json` is **not** staged for commit (it is gitignored).

Example `local.config.json`:

```json
{
  "gc2UnityProjectPath": "C:/Users/you/GC2-Knowledge-Build",
  "installedModules": ["Core", "Inventory", "Stats"]
}
```

### Optional: multi-root Cursor / VS Code workspace

Copy `gc2-docs.code-workspace.example` to `gc2-docs.code-workspace`, update the Knowledge Build path, and open that workspace. The personal workspace file is gitignored.

---

## Step 4: Write documentation

Read [DOCUMENTATION-STRUCTURE.md](DOCUMENTATION-STRUCTURE.md) before adding or reorganizing pages. In short:

- One GitBook **space per GC2 plugin** (Core, Inventory, Shooter, …).
- Each space has **Core Functionality**, **GC2 \<Plugin\> Demos**, **Code**, and **Visual Scripting**.
- **Visual Scripting comes first** — categorized catalogs of Triggers, Instructions, Conditions, and Signals, with details on behavior, inputs, and outputs.
- Verify names and categories against your Unity picker or licensed local install; never commit plugin source.

### Allowed in contributions

- Feature names, menu paths, and editor workflows
- Trigger, Instruction, Condition, and Event titles as shown in the GC2 UI
- Short illustrative snippets (keep them minimal)
- Behavior descriptions and step-by-step guides
- Screenshots (crop OS paths, usernames, and window titles)
- Images in `.gitbook/assets/` or external URLs

### Not allowed

- Full `.cs` source files or large pasted implementations
- Unity assets: `.meta`, `.unity`, `.asset`, `.csproj`, `.dll`
- Absolute filesystem paths (`C:\...`, `/Users/...`, `/home/...`)
- `file://` URLs
- MSBuild / Unity project leakage (`HintPath`, etc.)
- Anything you are not licensed to redistribute

### Unity path wording

| OK | Not OK |
|----|--------|
| `Game Creator > Preferences` | `C:\Users\you\Projects\...` |
| `Assets/Plugins/GameCreator/...` (conceptual) | `file:///C:/Users/...` |
| Relative links between doc pages | Paths inside screenshots |

---

## Step 5: Validate before submitting

From the repository root (Git Sync workflow):

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate-all.ps1
```

This runs:

- `validate-gitbook.ps1` — balanced `{% %}` custom blocks
- `validate-contributions.ps1` — no local paths, banned file types, or oversized code dumps

Fix any reported errors before opening a pull request or merging to `main`.

---

## Step 6: Submit changes

### GitBook editor

Edit in GitBook; changes sync to GitHub on merge/publish per your space settings.

### Git Sync (branch workflow)

1. Create a feature branch.
2. Edit markdown; update `SUMMARY.md` when adding, moving, or renaming pages.
3. Run `scripts/validate-all.ps1`.
4. Commit and push; open a pull request.
5. After review, merge to `main` — GitBook syncs from `main`.

---

## Pre-submission checklist

- [ ] No `local.config.json` or personal workspace files in the commit
- [ ] No absolute OS paths or `file://` links in markdown
- [ ] No Unity source or project files added
- [ ] `SUMMARY.md` updated for structural changes
- [ ] Screenshots cropped for privacy
- [ ] Validation scripts pass
- [ ] Content describes behavior you verified against **your** licensed install

---

## Questions

Open a GitHub issue in [GameCreator-2-Community-Documentation](https://github.com/dragonzero39/GameCreator-2-Community-Documentation) for process questions. For GC2 licensing and plugin access, refer to official Game Creator channels.
