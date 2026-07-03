---
description: >-
  Game Creator 2 Traversal — parkour, climbing, vaulting, traverse links,
  and interactive traversal for characters.
icon: person-running
---

# Game Creator 2 Traversal

The **Traversal** module extends Character movement with **parkour-style navigation**: vaulting, climbing, ladders, cover, grapple hooks, wall runs, zip lines, balance beams, slides, and more — for **player input** or **AI navigation agents**.

Official reference: [Traversal documentation](https://docs.gamecreator.io/traversal/)

**Requires:** Game Creator 2 Core

---

## What Traversal is capable of

### Traverse Link vs. Traverse Interactive

| Component | Use case |
|-----------|----------|
| **Traverse Link** | Scripted obstacle crossing — animation takes control to move between points (vault, jump gap) |
| **Traverse Interactive** | Fine-grained player-controlled movement in constrained environments (climb free, crawl) |

### Motion and actions

**Motion Link** and **Motion Interactive** define movement segments. **Actions** cover jumps, cancel attempts, and state enter/exit for motion phases.

### Built-in obstacle types

Ready-to-use patterns include balance, climb, cover, grapple hook, jumps, ladders, slide down/under, vault, wall-run, wall-slide, and zip-line — customizable with your animations.

### Connections and ropes

Auto-connect traverse interactives, directional traversal, and rope throw/cancel for grappling.

---

## How Traversal is typically used

1. Place **Traverse Link** or **Traverse Interactive** components on level geometry.
2. Configure connections, animations, and input for player characters.
3. Use Instructions (`Traverse Link`, `Enter Traverse Interactive`) from Triggers or AI.
4. Listen for **On Traverse Interactive Enter/Exit** events.
5. Combine with **Behavior** for NPC parkour and **Perception** for stealth routes.

---

## Visual Scripting overview

| Page | Examples |
|------|----------|
| **Triggers** | On Traverse Interactive Enter/Exit |
| **Instructions** | Traverse Link, Enter/Exit Interactive, Try Motion Jump, Throw Rope, Connection management |
| **Conditions** | Is Character Traversing |

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Traverse links, interactives, motion, navigation |
| [**GC2 Traversal Demos**](gc2-traversal-demos/overview.md) | Example obstacle setups |
| [**Code**](code/overview.md) | Custom traverse actions and motion |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority** — Events, Instructions, Conditions |

{% hint style="warning" %}
Drafted from [official documentation](https://docs.gamecreator.io/traversal/). Verify demo packages locally if installed.
{% endhint %}
