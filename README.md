---
description: >-
  Game Creator 2 Core — characters, cameras, visual scripting, variables, audio,
  saving, and the foundation every GC2 module builds on.
icon: laptop-code
---

# Game Creator 2 Core

**Game Creator 2 Core** is the foundation module for the entire GC2 ecosystem. It provides the character controller, camera systems, visual scripting framework, variables, audio, save/load, input, UI helpers, and shared runtime utilities that every other official module extends.

If you own any GC2 extension (Inventory, Stats, Shooter, etc.), you already depend on Core. This space documents how Core works, how to wire it through visual scripting, and how to learn from demo content.

Official reference: [Game Creator documentation](https://docs.gamecreator.io/gamecreator/)

---

## What Core is capable of

### Characters

Characters are fully featured scene entities with navigation, animation states, gestures, inverse kinematics, footstep audio, ragdoll, interaction, combat primitives (poise, invincibility, targeting), and player/NPC switching. The **Character** component is the hub most gameplay modules attach to.

### Cameras

The camera system uses **Camera Shots** — third-person, first-person, follow, lock-on, anchor, animation-driven shots, and more — switched through visual scripting or the main camera controller.

### Visual Scripting

Core defines the visual scripting model used across all modules:

| Component | Role |
|-----------|------|
| **Trigger** | Runs an Actions list when an **Event** fires |
| **Actions** | Sequential **Instructions** (task-list style, not node graphs) |
| **Conditions** | True/false checks for branching |
| **Signal** | Emit or receive named signals between objects |
| **Hotspot** | World UI interaction zones with **Spots** |

Core ships the largest visual scripting catalog (~75 events, ~345 instructions, ~100 conditions) covering audio, cameras, characters, input, physics, storage, UI, variables, and more.

### Variables

Four variable scopes power game state and save data:

- **Global Name** and **Global List** — shared across scenes, persisted with save games
- **Local Name** and **Local List** — scoped to a Game Object

### Audio

Channel-based audio (Ambient, Music, SFX, Speech, UI) with volume groups, fades, snapshots, and mixer parameter control — all drivable from visual scripting.

### Saving

Slot-based save/load with encryption and custom storage location hooks. Storage events (`On Save`, `On Load`, `On Delete`) integrate with Triggers.

### Additional systems

Input (Unity Input System), object pooling, markers, sequences, math/text/geometry instructions, scene loading, tweens, and developer tooling (debug console, gizmos).

---

## How Core is typically used

1. **Drop in a Character** — use Game Creator prefabs or add a Character component to your player/NPC.
2. **Add a Camera** — configure shots and a main camera controller.
3. **Wire gameplay with visual scripting** — Triggers listen for events; Actions run instructions; Conditions branch logic.
4. **Track state with Variables** — global for quest flags, local for per-object state.
5. **Persist progress** — Save/Load instructions and Storage events.
6. **Extend with modules** — Inventory, Dialogue, Stats, etc. plug into the same Character and visual scripting components.

Core favors **readable task lists** over spaghetti node graphs — each interaction stays organized in ordered instruction lists.

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/audio.md) | Characters, cameras, variables, audio, saving, settings — systems beyond single VS nodes |
| [**GC2 Core Demos**](gc2-core-demos/overview.md) | Demo packages and example scenes (Characters, Blockout, Examples) |
| [**Code**](code/overview.md) | Extension APIs, custom Instructions/Events/Conditions, integration patterns |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority reference** — Triggers, Instructions, Conditions, Signals |

---

## Module synergy

Core alone handles movement, interaction, cameras, and general logic. Official modules extend Core without replacing it:

- **Stats** adds RPG attributes to Characters
- **Inventory** adds Bags and equipment
- **Dialogue** and **Quests** drive narrative and objectives
- **Melee** / **Shooter** add combat stances and weapons
- **Behavior** runs AI graphs on any Game Object via **Processor**
- **Perception** adds sight, hearing, smell, and awareness
- **Traversal** adds parkour and obstacle navigation

Community docs for each module live in sibling spaces under the GC2 Community Documentation collection.

---

## Getting started

- New to GC2? Start with [Variables](core-functionality/variables.md) and [Triggers](visual-scripting/triggers.md).
- Prefer learning by scene? See [GC2 Core Demos](gc2-core-demos/overview.md).
- Official tutorials: [Getting Started](https://docs.gamecreator.io/gamecreator/getting-started/installation/)

{% hint style="info" %}
This is **community-maintained** documentation synced from GitHub. For vendor support and licensing, use official Game Creator channels.
{% endhint %}
