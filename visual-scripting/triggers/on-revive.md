---
description: >-
  Trigger event that runs when a Character revives from death in Game Creator 2.
icon: user
---

# On Revive

**Type:** Trigger event  
**Category:** Characters → On Revive  
**Component:** [Trigger](../triggers.md)

Runs when **this Character** **leaves the death state** and revives — typically after **Revive Character**, which plays a get-up animation and restores control. Use this to re-enable HUD, reset invincibility frames, clear game-over UI, or respawn at checkpoints.

For revival flow and ragdoll recovery, see [Characters (Core Functionality)](../../core-functionality/characters.md). For death entry, see [On Die](on-die.md).

---

## Adding this event

1. Add a **Trigger** component to the **Character GameObject** (recommended).
2. Open the event picker → **Characters** → **On Revive**.
3. Add **Actions** that should run when this Character revives.

No inspector fields — scoped to this Character only.

---

## When it runs

- When **Revive Character** completes on this Character (orientation-based get-up from ragdoll).
- When module or custom logic exits death state through the same Character API.

Does **not** fire on first spawn — only when transitioning **out of** death after [On Die](on-die.md) has occurred.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger — this Character |

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| Respawn | Teleport to checkpoint; restore health via Stats instructions |
| UI | Hide game-over panel; restore player HUD |
| Invincibility | **Set Invincible** for brief spawn protection |
| Audio | **Play Music** resume exploration BGM |

---

## Notes

- Configure **Recover Face Down** / **Recover Face Up** clips and **Transition Duration** (≥ 0.5s recommended) in the Ragdoll section for smooth get-up.
- [On Recover Ragdoll](../triggers.md) may also fire around ragdoll recovery — use **On Revive** for gameplay state, ragdoll triggers for physics-specific logic.
- Pair with [On Die](on-die.md) for symmetric death/revival handling on the same Character.

---

## Related

- [Characters (Core Functionality)](../../core-functionality/characters.md) — **Revive Character**, ragdoll recovery
- [Character Triggers](../characters.md) — all root-level character trigger events
- [On Die](on-die.md) — death counterpart
