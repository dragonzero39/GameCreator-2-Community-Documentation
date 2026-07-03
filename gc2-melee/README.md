---
description: >-
  Game Creator 2 Melee — close combat weapons, skills, combos, blocking,
  parrying, shields, and reactions.
icon: sword
---

# Game Creator 2 Melee

The **Melee** module implements close-quarters combat: **melee weapons**, **skills** with charge/strike phases, **combos**, **blocking** and **parrying**, **shields**, **reactions** to hits, input buffering, and poise integration with Core Characters.

Combat runs through **Melee Stance** on Characters — equip weapons, execute skills, manage defense windows, and respond to hits via visual scripting.

Official reference: [Melee documentation](https://docs.gamecreator.io/melee/)

**Requires:** Game Creator 2 Core

---

## What Melee is capable of

### Weapons and skills

**MeleeWeapon** assets define available **Skills** — each skill has charges, strikes, motion, timing windows, poise damage, and optional **Sequence** tracks for animation-synced hit frames.

### Combos and input

**Combos** chain skills from input patterns. Instructions handle charge, execute, buffer windows, cancel attempts, and phase waits.

### Defense

**Shields** and blocking/parrying with timing-based **Conditions** (time since last block/parry/break). **Defense** instructions set block state and shield references.

### Reactions

**MeleeReaction** assets play responses to hits, blocks, and breaks — wired through Instructions and Events.

### Targets and poise

Integrates with Core Character combat (poise, invincibility, targeting) for souls-like or action combat loops.

---

## How Melee is typically used

1. Create **MeleeWeapon**, **Skill**, **Combos**, **Shield**, and **Reaction** assets.
2. Equip melee weapons on Characters; listen for **On Melee Hit** and input events.
3. Branch with Conditions for blocking state, attack phase, and combo timing.
4. Combine with **Stats** for damage formulas and **Inventory** for weapon items.

---

## Visual Scripting overview

~5 events, ~18 instructions, ~10 conditions:

| Page | Examples |
|------|----------|
| **Triggers** | On Equip/Unequip, On Melee Hit, On Input Charge/Execute |
| **Instructions** | Play Melee Skill, Start/Stop Blocking, Input Execute, Try Cancel Skill |
| **Conditions** | Is Blocking, In Attack Phase, Has Equipped Melee, timing checks |

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Weapons, skills, shields, combos, reactions, input |
| [**GC2 Melee Demos**](gc2-melee-demos/overview.md) | Brawl, Sword, SwordFPS, Examples |
| [**Code**](code/overview.md) | Custom skills, hit detection hooks |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority** — Events, Instructions, Conditions |

Demo packages: `Melee.Brawl`, `Melee.Examples`, `Melee.Sword`, `Melee.SwordFPS`
