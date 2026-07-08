---
description: >-
  Trigger event that runs when a Character becomes the Player in Game Creator 2.
icon: user
---

# On Become Player

**Type:** Trigger event  
**Category:** Characters → On Become Player  
**Component:** [Trigger](../triggers.md)

Runs when **this Character** becomes the **Player** — the single Character in the scene with **Is Player** enabled and active input through the Player unit. Use this to bind cameras, refresh HUD portraits, enable input profiles, or run intro logic when control switches to this Character.

For Player/NPC rules and the **Change Player** instruction, see [Characters (Core Functionality)](../../core-functionality/characters.md). For the opposite transition, see [On Become NPC](on-become-npc.md).

---

## Adding this event

1. Add a **Trigger** component to the **Character GameObject** (recommended).
2. Open the event picker → **Characters** → **On Become Player**.
3. Add **Actions** that should run when this Character gains Player status.

No inspector fields — the event is scoped to the Character that owns the Trigger (or the Character whose lifecycle the Trigger subsystem associates with this component).

---

## When it runs

- When **Change Player** sets **Is Player** on this Character.
- When creating a Player from **Game Creator → Characters → Player** at runtime if that flow enables **Is Player** on this object.
- **After** the previous Player receives [On Become NPC](on-become-npc.md) during a **Change Player** swap.

Does **not** fire on scene load for a Character that was already the Player unless a switch occurs while the Trigger is enabled.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger — should be this Character |

Use **Self** in Actions that need a Character reference (camera follow, UI portrait, **Set Player Input**, etc.).

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| Party swap | Enable selection ring; retarget follow camera to **Self** |
| Possession | Show possessed-character HUD; hide previous Player UI |
| Input profile | **Set Player Input** to Directional or Tank for this Character |
| Save checkpoint | Mark this Character as last controlled in a Global Variable |

---

## Notes

- Only one Player exists per scene — this event means **this** Character is now that Player.
- Pair with [On Become NPC](on-become-npc.md) on the same Character for symmetric setup/teardown when swapping away later.
- Does not replace combat or navigation triggers — use those for jump, dash, and target changes.

---

## Related

- [Characters (Core Functionality)](../../core-functionality/characters.md) — Player vs NPC, **Change Player**
- [Character Triggers](../characters.md) — all root-level character trigger events
- [On Become NPC](on-become-npc.md) — opposite transition
