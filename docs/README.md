---
description: >-
  Community documentation collection for Game Creator 2 — how spaces are
  organized and how to contribute.
icon: book
---

# GC2 Community Documentation

Welcome to the **community-maintained** documentation collection for [Game Creator 2](https://gamecreator.io/). This collection complements the [official documentation](https://docs.gamecreator.io/) with contributor-driven guides, visual scripting catalogs, and module-specific references.

## Collection spaces

Each **GitBook space** maps to a GC2 module (or topic). Every module space uses the same four-section layout:

| Section | Purpose |
|---------|---------|
| **Core Functionality** | Systems, assets, editor workflows |
| **GC2 \<Module\> Demos** | Example scenes and demo packages |
| **Code** | Extension APIs and integration patterns |
| **Visual Scripting** | Triggers, Instructions, Conditions — **highest priority** |

### Official Game Creator 2 modules

| Space | Module |
|-------|--------|
| [GC2 Core](../README.md) | Foundation — characters, cameras, VS framework |
| [GC2 Inventory](../gc2-inventory/README.md) | Items, bags, equipment, merchants, crafting |
| [GC2 Shooter](../gc2-shooter/README.md) | Ranged weapons, sights, ammo, reload |
| [GC2 Melee](../gc2-melee/README.md) | Melee combat, skills, combos, blocking |
| [GC2 Stats](../gc2-stats/README.md) | RPG stats, attributes, status effects, formulas |
| [GC2 Dialogue](../gc2-dialogue/README.md) | Conversations, branching, actors, skins |
| [GC2 Quests](../gc2-quests/README.md) | Quests, tasks, journal, tracking UI |
| [GC2 Behavior](../gc2-behavior/README.md) | AI — behavior trees, state machines, GOAP, utility AI |
| [GC2 Perception](../gc2-perception/README.md) | Sight, hearing, smell, awareness, evidence |
| [GC2 Traversal](../gc2-traversal/README.md) | Parkour, climbing, vaulting, traverse links |

### Third-party extensions

| Space | Notes |
|-------|-------|
| [GC2 Abilities (External)](../gc2-abilities-external/README.md) | Third-party abilities plugin |
| [Arawn Agnostic Networking Layer](../gc2-arawn-agnostic-networking/README.md) | Transport-independent GC2 multiplayer core |
| [Arawn PurrNet Integration](../gc2-arawn-purrnet/README.md) | PurrNet transport for Arawn networking |
| [Arawn Photon Integration](../gc2-arawn-photon/README.md) | Photon transport for Arawn networking |

---

## Git Sync — project directory per space

All spaces use the **same GitHub repo** and **`main` branch**. Each space sets a **Project directory** in GitBook (Settings → Integrations → Git Sync):

| GitBook space | Project directory |
|---------------|-------------------|
| Docs | `docs` |
| GC2 Core | `/` (repo root) |
| GC2 Inventory | `gc2-inventory` |
| GC2 Shooter | `gc2-shooter` |
| GC2 Melee | `gc2-melee` |
| GC2 Stats | `gc2-stats` |
| GC2 Dialogue | `gc2-dialogue` |
| GC2 Quests | `gc2-quests` |
| GC2 Behavior | `gc2-behavior` |
| GC2 Perception | `gc2-perception` |
| GC2 Traversal | `gc2-traversal` |
| GC2 Abilities (External) | `gc2-abilities-external` |
| Arawn Agnostic Networking Layer | `gc2-arawn-agnostic-networking` |
| Arawn PurrNet Integration | `gc2-arawn-purrnet` |
| Arawn Photon Integration | `gc2-arawn-photon` |

Do **not** point every space at repo root — that makes all spaces show Core navigation only.

---

- **GitBook editor** — edit directly in GitBook (no clone required)
- **GitHub / Git Sync** — clone, edit markdown, run validators, open a PR

Read [CONTRIBUTING.md](../CONTRIBUTING.md) and [DOCUMENTATION-STRUCTURE.md](../DOCUMENTATION-STRUCTURE.md) before submitting changes.

## Read local, write public

Contributors verify accuracy against their **licensed local Unity install**. Plugin source and machine paths stay private — this collection publishes **knowledge only**.
