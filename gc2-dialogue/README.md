---
description: >-
  Game Creator 2 Dialogue — conversations, branching choices, actors,
  expressions, skins, and cinematic dialogue.
icon: comments
---

# Game Creator 2 Dialogue

The **Dialogue** module handles character communication: cinematic dialogues, barks, branching **choices**, **actors** with **expressions**, customizable **skins**, animation timelines, dynamic text values, and full visual scripting for play/stop/skip and UI control.

Official reference: [Dialogue documentation](https://docs.gamecreator.io/dialogue/)

**Requires:** Game Creator 2 Core

---

## What Dialogue is capable of

### Dialogues and nodes

**Dialogue** assets are node graphs — lines, choices, conditions, and jumps. Supports dynamic values injected at runtime and tags for visited-state tracking.

### Actors and expressions

**Actor** assets define speakers with portrait expressions that swap during lines.

### Skins and UI

**Skin** assets control dialogue UI layout, typewriter effects, and choice presentation.

### Animation timeline

Sync character gestures and camera cuts to dialogue lines.

### Integration

Combine with **Stats** (skill checks on choices), **Quests** (dialogue activates tasks), and **Inventory** (item-gated options).

---

## How Dialogue is typically used

1. Create **Dialogue**, **Actor**, and **Skin** assets.
2. Build conversation nodes with branches and conditions.
3. Use **Play Dialogue** instruction from Triggers (interaction, quest steps).
4. Listen for **On Start/Finish Dialogue** and line events for gameplay reactions.
5. Track **Tag Visited** conditions for one-time or evolving conversations.

---

## Visual Scripting overview

| Page | Examples |
|------|----------|
| **Triggers** | On Start/Finish Dialogue, On Actor Start/Finish Line |
| **Instructions** | Play Dialogue, Stop Dialogue, Skip Line, Choice Index |
| **Conditions** | Dialogue Played, Tag Visited |

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Dialogues, nodes, actors, skins, UI |
| [**GC2 Dialogue Demos**](gc2-dialogue-demos/overview.md) | Example dialogue scenes |
| [**Code**](code/overview.md) | Custom nodes, dynamic values |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority** — Events, Instructions, Conditions |

{% hint style="warning" %}
This module was drafted from [official documentation](https://docs.gamecreator.io/dialogue/). Contributors with a licensed install should verify picker names and demo package lists locally.
{% endhint %}
