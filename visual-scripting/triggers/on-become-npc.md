---
description: >-
  Trigger event that runs when a Character stops being the Player in Game
  Creator 2.
icon: user
---

# On Become NPC

**Type:** Trigger event  
**Category:** Characters → On Become NPC  
**Component:** [Trigger](../triggers.md)

Runs when **this Character** **stops being the Player** — **Is Player** turns off and the Player unit no longer processes input for this Character. Use this to hide player-only UI, hand off AI control, or save state when control moves to another Character.

For Player/NPC rules, see [Characters (Core Functionality)](../../core-functionality/characters.md). For the opposite transition, see [On Become Player](on-become-player.md).

---

## Adding this event

1. Add a **Trigger** component to the **Character GameObject** (recommended).
2. Open the event picker → **Characters** → **On Become NPC**.
3. Add **Actions** for when this Character loses Player status.

No inspector fields — scoped to this Character's lifecycle.

---

## When it runs

- When **Change Player** transfers control **away** from this Character to another.
- When **Is Player** is cleared through visual scripting or editor workflow that demotes this Character to NPC.
- **Before** the new Player receives [On Become Player](on-become-player.md) during a standard **Change Player** swap.

Does **not** fire when an NPC that was never the Player performs NPC behavior.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger — should be this Character |

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| Party swap | Disable player HUD elements; start follow AI on **Self** |
| Cutscene possession | Clear input highlights; store inventory snapshot |
| Multi-character hub | Hide minimap arrow for this Character |

---

## Notes

- The Character remains in the scene as an NPC — only input and Player status change.
- Use [On Become Player](on-become-player.md) on the **new** Character for setup when they gain control.
- **Is Controllable** can block input without firing this event if **Is Player** stays on.

---

## Related

- [Characters (Core Functionality)](../../core-functionality/characters.md) — **Change Player**, kernel units
- [Character Triggers](../characters.md) — all root-level character trigger events
- [On Become Player](on-become-player.md) — opposite transition
