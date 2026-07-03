---
description: >-
  Game Creator 2 Behavior — AI with behavior trees, state machines, GOAP,
  utility AI, and action plans.
icon: robot
---

# Game Creator 2 Behavior

The **Behavior** module provides industry-standard **AI authoring** for NPCs and any Game Object: **Behavior Trees**, **State Machines**, **GOAP Action Plans**, and **Utility AI** boards — all executed by the **Processor** component with blackboard **parameters** exposed to visual scripting.

Official reference: [Behavior documentation](https://docs.gamecreator.io/behavior/)

**Requires:** Game Creator 2 Core

---

## What Behavior is capable of

### Processor component

Attach **Processor** to any Game Object (not only Characters). Assign a graph asset, configure loop/update mode, and set blackboard parameters in the inspector or via visual scripting.

### Graph types

| Graph | Best for |
|-------|----------|
| **Behavior Tree** | Hierarchical AI with selectors, sequences, decorators |
| **State Machine** | Discrete states with transitions |
| **Action Plan (GOAP)** | Goal-oriented planning with dynamic goals |
| **Utility Board** | Scoring-based decision making |

### Parameters (blackboard)

Typed parameters (Game Object, decimal, bool, etc.) interface between the graph and the scene — e.g. per-guard patrol routes.

### Visual scripting bridge

Start/stop and tick processors; add/remove GOAP goals; react to processor start/finish events.

---

## How Behavior is typically used

1. Create a graph asset (**Behavior Tree**, **State Machine**, etc.).
2. Add **Processor** to an NPC; assign the graph and parameter values.
3. Optionally drive parameters from Triggers (e.g. subtract energy every second).
4. Combine with **Perception** (awareness inputs) and **Melee/Shooter** (combat actions as tree leaves).

---

## Visual Scripting overview

Small, focused catalog (~2 events, ~3 instructions, ~1 condition):

| Page | Examples |
|------|----------|
| **Triggers** | On Processor Start, On Processor Finish |
| **Instructions** | Processor Update, Add Goal, Remove Goal |
| **Conditions** | Is Processor Running |

Most AI logic lives in graphs; visual scripting orchestrates lifecycle and parameters.

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Processor, graphs, blackboard, each AI system |
| [**GC2 Behavior Demos**](gc2-behavior-demos/overview.md) | ActionPlan, BehaviorTree, StateMachine, UtilityBoard |
| [**Code**](code/overview.md) | Custom nodes, new graph types |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority** — Events, Instructions, Conditions |

Demo packages: `Behavior.ActionPlan`, `Behavior.BehaviorTree`, `Behavior.StateMachine`, `Behavior.UtilityBoard`
