---
description: >-
  Trigger event that runs when a Character dies in Game Creator 2.
icon: user
---

# On Die

**Type:** Trigger event  
**Category:** Characters → On Die  
**Component:** [Trigger](../triggers.md)

Runs when **this Character** enters the **death state**. Use this for death animations, disabling input, spawning loot, showing game-over UI, or triggering ragdoll-adjacent effects local to this Character.

For death, **Kill Character**, and ragdoll setup, see [Characters (Core Functionality)](../../core-functionality/characters.md). For revival, see [On Revive](on-revive.md).

---

## Adding this event

1. Add a **Trigger** component to the **Character GameObject** (recommended).
2. Open the event picker → **Characters** → **On Die**.
3. Add **Actions** that should run when this Character dies.

No inspector fields — scoped to this Character only.

---

## When it runs

- When **Kill Character** runs on this Character.
- When module logic (e.g. GC2 Stats health reaching zero) invokes the Character death state.
- Typically **before or alongside** automatic ragdoll activation from **Kill Character**.

Does **not** fire for other Characters' deaths. Does **not** fire again until the Character revives and dies again.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger — this Character |

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| Player death | Fade screen, show retry UI, **Save Game** checkpoint |
| Enemy death | Spawn loot, increment kill counter Global Variable |
| Disable control | **Is Controllable** = false (if not already handled by death state) |
| VFX | Emit Signal `enemy-defeated`, play particle at **Self** position |

---

## Notes

- **Kill Character** often enables ragdoll automatically — ragdoll-specific triggers are **On Start Ragdoll** / **On Recover Ragdoll** on [Triggers](../triggers.md).
- Global game-over logic can live on a manager; **On Die** on the Player Character is ideal for player-specific feedback.
- Pair with [On Revive](on-revive.md) if the Character can respawn in the same session.

---

## Related

- [Characters (Core Functionality)](../../core-functionality/characters.md) — death, **Kill Character**, ragdoll
- [Character Triggers](../characters.md) — all root-level character trigger events
- [On Revive](on-revive.md) — revival counterpart
