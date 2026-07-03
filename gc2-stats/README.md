---
description: >-
  Game Creator 2 Stats — RPG stats, attributes, classes, traits, formulas,
  modifiers, and status effects.
icon: chart-line
---

# Game Creator 2 Stats

The **Stats** module adds RPG mechanics to Game Creator 2: **stats** and **attributes**, **classes** and **traits**, **formulas**, **stat modifiers**, **status effects**, level **tables**, and Unity UI bindings — all driven through visual scripting on Characters and other entities.

Official reference: [Stats documentation](https://docs.gamecreator.io/stats/)

**Requires:** Game Creator 2 Core

---

## What Stats is capable of

### Stats, attributes, and classes

**Stat** and **Attribute** assets define numeric properties (health, strength, mana, etc.). **Class** assets group default traits. **Traits** components on Game Objects hold runtime stat/attribute values.

### Formulas and modifiers

**Formula** assets compute derived values from stats. **Stat modifiers** apply temporary or permanent bonuses. Instructions add/remove modifiers and change base values.

### Status effects

**StatusEffect** assets define timed or permanent buffs/debuffs with stacking rules. Events fire on stat, attribute, and status-effect changes.

### Tables and progression

**Table** assets map levels to stat growth — useful for character progression systems.

### User interface

Stat, Attribute, Formula, and Status Effect UI components bind to traits for HUD and character sheets.

---

## How Stats is typically used

1. Define **Stat**, **Attribute**, **Class**, **Formula**, and **StatusEffect** assets.
2. Add **Traits** to Characters; assign a class or custom stat set.
3. Use Conditions in **Dialogue** (intimidation checks) or **Quests** (level gates).
4. React to **On Stat Change** events for UI updates and gameplay triggers.
5. Combine with **Inventory** (item stat bonuses) and combat modules for damage.

---

## Visual Scripting overview

~3 events, ~16 instructions, ~8 conditions:

| Page | Examples |
|------|----------|
| **Triggers** | On Stat Change, On Attribute Change, On Status Effect Change |
| **Instructions** | Change Stat, Add Status Effect, Add Stat Modifier, Set Formula |
| **Conditions** | Compare Stat, Compare Attribute, Has Status Effect, Is Traits of Class |

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Classes, stats, attributes, formulas, modifiers, status effects, UI |
| [**GC2 Stats Demos**](gc2-stats-demos/overview.md) | Classes, Examples, UI packages |
| [**Code**](code/overview.md) | Traits API, custom formulas |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority** — Events, Instructions, Conditions |

Demo packages: `Stats.Classes`, `Stats.Examples`, `Stats.UI`
