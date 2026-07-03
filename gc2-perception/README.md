---
description: >-
  Game Creator 2 Perception — AI senses with sight, hearing, smell, feel,
  awareness stages, and evidence.
icon: eye
---

# Game Creator 2 Perception

The **Perception** module gives NPCs (and any entity with a **Perception** component) human-like **senses**: **sight** (line of sight, luminance), **hearing** (noise, global din), **smell** (scent, dissipation), and **feel**, plus **awareness** tracking, **evidence** tampering, **camouflage**, and **obstruction**.

Official reference: [Perception documentation](https://docs.gamecreator.io/perception/)

**Requires:** Game Creator 2 Core

---

## What Perception is capable of

### Senses

| Sense | Capability |
|-------|------------|
| **See** | Line of sight, luminance at position, on-see events |
| **Hear** | Noise emission, noise tags, global din levels |
| **Smell** | Scent tags, dissipation over distance/time |
| **Feel** | Proximity/touch-style detection |

### Awareness

Track awareness level and **stage** per target; increase/decrease, relay knowledge between agents, and untrack targets.

### Evidence

Place tamperable **Evidence** in scenes; NPCs notice, relay, and restore evidence — useful for stealth and investigation gameplay.

### Environment modifiers

**Luminance** (global/scene lighting for vision), **Din** (ambient noise floor), **Camouflage**, and **Obstruction** shape detection difficulty.

### UI

Awareness, luminance, noise, and smell debug/UI components for designers.

---

## How Perception is typically used

1. Add **Perception** to NPCs; configure sensor ranges and awareness curves.
2. Emit **Noise** or **Scent** from player actions (footsteps, spells, objects).
3. Use **On See/Hear/Smell** events to drive **Behavior** trees or combat Triggers.
4. Branch with Conditions (`Can See`, `Can Hear Noise`, `In Awareness Stage`).
5. Combine with **Traversal** and stealth level design (cover, light, noise).

---

## Visual Scripting overview

~10 events, ~14 instructions, ~9 conditions:

| Page | Examples |
|------|----------|
| **Triggers** | On See, On Hear, On Smell, On Change Awareness Stage, On Notice Evidence |
| **Instructions** | Increase/Decrease Awareness, Emit Noise, Emit Scent, Tamper Evidence |
| **Conditions** | Can See, Can Hear Noise, Compare Awareness, In Awareness Stage |

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Sensors, awareness, evidence, luminance, camouflage |
| [**GC2 Perception Demos**](gc2-perception-demos/overview.md) | Examples, UI packages |
| [**Code**](code/overview.md) | Custom sensors and stimulus types |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority** — Events, Instructions, Conditions |

Demo packages: `Perception.Examples`, `Perception.UI`
