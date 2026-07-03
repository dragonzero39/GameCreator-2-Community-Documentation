# Documentation Structure Guide

This guide defines **what goes where** in the GC2 Community Documentation GitBook space. Use it alongside [CONTRIBUTING.md](CONTRIBUTING.md) for workflow, safety, and validation rules.

Game Creator 2 is primarily a **visual scripting** toolkit. Documentation should reflect how creators actually use GC2 in Unity — with **Visual Scripting as the highest priority** in every plugin space.

---

## GitBook hierarchy

The documentation is organized as a **collection of plugin spaces**. Each licensed GC2 module (or module group) gets its own space with the **same four-section layout**.

```
GC2 Community Documentation (collection)
├── Docs                          ← meta / overview (optional)
├── GC2 Core
├── GC2 Inventory
├── GC2 Shooter
├── GC2 Melee
├── GC2 Stats
├── GC2 Dialogue
├── GC2 Quests
├── GC2 Perception
├── GC2 Traversal
└── … (other modules as contributors add them)
```

Each plugin space uses this sidebar structure:

| Section | Purpose | Priority |
|---------|---------|----------|
| **Core Functionality** | How the module works — systems, settings, editor workflows, concepts | Medium |
| **GC2 \<Plugin\> Demos** | Walkthroughs of official or community demo scenes; “how to learn by example” | Medium |
| **Code** | Knowledge for developers extending GC2 — APIs, patterns, integration notes (not source dumps) | Lower |
| **Visual Scripting** | Reference for Triggers, Instructions, Conditions, Signals, and related VS entries | **Highest** |

The **README** (space homepage) introduces the plugin. The four sections above are **SUMMARY.md groups** (GitBook sidebar headings).

---

## Section details

### Core Functionality

Document **features and systems** that are not tied to a single visual scripting node:

- Module settings (e.g. **Game Creator → Preferences**)
- Major components (Character, Bag, Weapon, etc.)
- Data assets (ScriptableObjects, item definitions)
- Editor menus and inspectors
- How subsystems connect (high-level architecture)

**Audience:** Designers and developers who need to understand *what the module does* before wiring graphs.

**Example topics (GC2 Core):** Audio, Saving, Variables.

---

### GC2 \<Plugin\> Demos

Document **demo scenes and sample projects** shipped with or built for the module:

- Scene name and location inside the demo project (conceptual path, e.g. `Assets/Demos/...`)
- What the demo teaches
- Step-by-step “open scene → press Play → observe X”
- Links to related Visual Scripting entries used in the demo

**Audience:** Learners who prefer learning by example.

---

### Code

Document **developer-oriented knowledge** without pasting proprietary source:

- Public extension points and recommended patterns
- How to hook custom C# into GC2 events or instructions
- Integration notes (input, networking, third-party assets)
- Short **illustrative** snippets only (see CONTRIBUTING.md size limits)

**Audience:** Programmers extending or integrating GC2.

**Not for:** Full class implementations, copied plugin files, or MSBuild/project references.

---

### Visual Scripting (priority)

This is the **main reference** for each plugin. GC2 gameplay is built from visual graphs on components such as **Trigger**, **Actions**, **Conditions**, and **Signal**.

Organize Visual Scripting pages by **component type**, then by **category** (matching the Unity picker):

| Page (typical) | GC2 component / picker | What it lists |
|----------------|--------------------------|---------------|
| **Triggers** | **Trigger** → Events | Events that *start* a Trigger graph (e.g. On Start, On Interact) |
| **Instructions** | **Actions** → Instructions | Steps that run inside an Actions list |
| **Conditions** | **Conditions** | Branch checks (true/false) |
| **Signals** | **Signal** receiver / emitter | Named signals and when they fire |
| **Components** | Other VS components | Hotspots, Spots, Sequences, etc. (when applicable to the module) |

Use additional pages only when a module needs them (e.g. module-specific component docs). Keep naming aligned with **exact UI labels** in the Game Creator editors.

#### Category grouping (required pattern)

Within each Visual Scripting page, group entries using **collapsible sections** (`<details>` / `<summary>` in markdown, or GitBook expandables) that mirror GC2’s **Category** path in the picker.

Example from GC2 Core → Triggers:

```
Input/On Cursor Click     →  section "Input" or "Core Input Triggers"
Characters/On Revive      →  section "Core Character Triggers"
Audio/On Change Music Volume → section "Core Audio Triggers"
```

The live [Triggers](visual-scripting/triggers.md) page follows this pattern: categories as summaries, individual events listed inside.

**Rule:** Category names in docs should match what contributors see in Unity. When verifying locally, use the picker path or the `[Category("…")]` metadata on the entry — describe behavior in your own words; do not paste source files.

---

## Documenting a Visual Scripting entry

Start with a **catalog listing** (name under the right category). Add a **detail block** when the entry needs explanation beyond the picker tooltip.

### Minimum catalog entry

For each Trigger, Instruction, Condition, or Signal:

- **Exact title** as shown in the GC2 UI (e.g. `On Cursor Click`, not `EventOnCursorClick`)
- Placed under the correct **category** section on the right page

### Full entry template (when documenting details)

Use this structure for expanded documentation (headings or expandables per entry):

```markdown
### On Cursor Click

**Type:** Trigger event  
**Category:** Input / On Cursor Click  
**Component:** Trigger (on Game Object)

**Summary:** One sentence — when this event runs.

**When it runs:** Lifecycle / input / collision / variable change / etc.

**Requirements:** Collider required, Character required, specific module installed, etc.

**Inputs (inspector fields):** What the user configures — Layer Mask, Press Count, Target, Bag, etc.

**Outputs / context:** What the graph can use after the event fires (Self, Target, hit data, changed variable, etc.).

**Notes:** Edge cases, order of execution, interaction with other systems.

**Related:** Links to Instructions, Conditions, or Core Functionality pages.
```

Adapt fields to the entry type:

| Type | Emphasize |
|------|-----------|
| **Trigger event** | When it fires, requirements (collider, character), what `Self` refers to |
| **Instruction** | What it does, async/wait behavior, which objects it affects |
| **Condition** | What is tested, true vs false paths, required references |
| **Signal** | Signal name, emitter vs receiver, payload if any |

---

## Research workflow (read local, write public)

Contributors verify behavior against a **licensed local install** (see CONTRIBUTING.md). Typical layout:

```
Assets/Plugins/GameCreator/Packages/<Module>/Runtime/VisualScripting/
├── Events/          → Triggers page
├── Instructions/    → Instructions page
├── Conditions/      → Conditions page
├── …
```

**In Unity (preferred for most contributors):**

1. Add or select a **Trigger**, **Actions**, **Conditions**, or **Signal** component.
2. Open the event/instruction/condition picker.
3. Note **Title**, **Category**, **Description**, and inspector fields.
4. Test in Play Mode when behavior is unclear.

**With a local clone + AI tools (optional):**

1. Configure `local.config.json` with your Unity project path.
2. Use picker metadata and runtime behavior — not bulk source export.
3. Write descriptions in plain language; never commit `.cs` files.

**Module coverage:** Only document modules you have licensed and installed. Mark pages or sections as incomplete rather than guessing.

---

## File and navigation conventions (Git Sync)

**GC2 Core** syncs from the **repository root** (`README.md`, `SUMMARY.md`, and section folders).

Other module spaces live in sibling folders with the same internal layout:

```
README.md / SUMMARY.md / …         ← GC2 Core (GitBook root sync)
docs/README.md                     ← Collection overview (Docs space)
gc2-inventory/                     ← GC2 Inventory space
gc2-shooter/
gc2-melee/
gc2-stats/
gc2-dialogue/
gc2-quests/
gc2-behavior/
gc2-perception/
gc2-traversal/
gc2-abilities-external/            ← Third-party (not official GC2)
gc2-arawn-agnostic-networking/       ← Arawn transport-agnostic core
gc2-arawn-purrnet/                 ← Arawn PurrNet transport
gc2-arawn-photon/                  ← Arawn Photon transport
```

Each module folder contains:

```
README.md                          ← space homepage
SUMMARY.md                         ← sidebar (four sections)
core-functionality/
gc2-<module>-demos/
code/
visual-scripting/
```

Configure each GitBook space Git Sync to point at the matching folder (Core uses repo root). Keep **SUMMARY.md** aligned with GitBook per space.

### SUMMARY.md rules

- One homepage link at the top (`README.md`).
- Four `##` section headers matching the table above.
- Page titles match GitBook sidebar labels.
- No duplicate paths to the same markdown file.

### Page frontmatter (optional)

```yaml
---
description: Short summary for GitBook and search
icon: star
---
```

Use `description` for Visual Scripting hub pages (e.g. Triggers overview).

---

## Quality bar

| Do | Avoid |
|----|--------|
| Match **exact UI names** from GC2 | Internal class names (`EventOnCursorClick`) as primary labels |
| Group by **picker categories** | Flat unordered lists with hundreds of entries |
| Explain **when** and **why** to use an entry | Copying `[Description]` only, with no context |
| Document **inputs/outputs** in inspector terms | Pasting serialized field code |
| Link related pages across sections | Isolated entries with no cross-references |
| Expand high-traffic entries first | Blocking publication until every entry is fully detailed |

**Phased approach:** Phase 1 — complete categorized **catalogs** for Visual Scripting. Phase 2 — expand detail blocks for common entries. Phase 3 — Core Functionality, Demos, and Code depth.

---

## Current status

| Space | Homepage | Section scaffolds | VS catalogs |
|-------|----------|-------------------|-------------|
| **GC2 Core** (root) | Draft complete | Audio, Saving, Variables + overviews | Triggers started; Instructions/Conditions stubbed |
| **GC2 Inventory** | Draft complete | Overview pages | Stubbed |
| **GC2 Shooter** | Draft complete | Overview pages | Stubbed |
| **GC2 Melee** | Draft complete | Overview pages | Stubbed |
| **GC2 Stats** | Draft complete | Overview pages | Stubbed |
| **GC2 Dialogue** | Draft complete | Overview pages | Stubbed (verify locally) |
| **GC2 Quests** | Draft complete | Overview pages | Stubbed (verify locally) |
| **GC2 Behavior** | Draft complete | Overview pages | Stubbed |
| **GC2 Perception** | Draft complete | Overview pages | Stubbed |
| **GC2 Traversal** | Draft complete | Overview pages | Stubbed (verify locally) |
| **GC2 Abilities (External)** | Placeholder | Scaffold only | Awaiting third-party contributors |
| **Arawn Agnostic Networking** | Draft complete | Scaffold only | Awaiting contributors |
| **Arawn PurrNet Integration** | Draft complete | Scaffold only | Awaiting contributors |
| **Arawn Photon Integration** | Draft complete | Scaffold only | Awaiting contributors |
| **Docs** (collection) | Draft complete | N/A | Links to all spaces + Git Sync table |

Use **GC2 Core** as the reference implementation for depth; other spaces follow the same layout.

---

## Quick checklist for Visual Scripting contributions

- [ ] Entry title matches GC2 UI exactly
- [ ] Entry is under the correct page (Triggers / Instructions / Conditions / Signals)
- [ ] Entry is inside the correct **category** `<details>` section
- [ ] Behavior verified in Unity or licensed local install
- [ ] No source files, absolute paths, or large code dumps
- [ ] `SUMMARY.md` updated if adding or renaming pages
- [ ] `scripts/validate-all.ps1` passes
