---
description: >-
  Trigger event that runs when a Character's visible model is swapped in Game
  Creator 2.
icon: user
---

# On Change Model

**Type:** Trigger event  
**Category:** Characters → On Change Model  
**Component:** [Trigger](../triggers.md)

Runs when **this Character's** visible **model** is swapped — typically after the **Change Model** instruction or an equivalent runtime swap. Use this to resize colliders, reattach props, refresh footstep tables, or update UI silhouettes.

For models, mannequin, and the **Change Model** instruction, see [Characters (Core Functionality)](../../core-functionality/characters.md).

---

## Adding this event

1. Add a **Trigger** component to the **Character GameObject** (recommended).
2. Open the event picker → **Characters** → **On Change Model**.
3. Add **Actions** that should run after the new model is in place.

No inspector fields — fires for the Character associated with this Trigger.

---

## When it runs

- After **Change Model** completes on this Character (including optional Skeleton, Footstep Sounds, and offset updates).
- When editor or runtime workflows replace the Animation section model if they emit the same lifecycle event.

Does **not** fire for prop attach/detach alone — use **Attach Prop** / **Remove Prop** flows or Visuals instructions for equipment that does not swap the base model.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger — this Character |

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| Armor equip | **Change Height** / **Change Radius** to match new mesh |
| Transform creature | Reapply **Attach Prop** for tail or wings on new skeleton |
| Footsteps | **Change Footstep Sounds** if material table changed with model |
| UI | Refresh character portrait render texture |

---

## Notes

- Run collision and IK fixes here — the new mesh may differ in height and bone layout.
- **Put On Skin Mesh** / **Take Off Skin Mesh** may not fire this event; prefer **Change Model** when the whole character mesh swaps.
- Test humanoid vs generic rigs — animation retargeting depends on the Skeleton asset passed to **Change Model**.

---

## Related

- [Characters (Core Functionality)](../../core-functionality/characters.md) — models, mannequin, **Change Model**
- [Character Triggers](../characters.md) — all root-level character trigger events
- [Instructions](../instructions.md) — **Change Model**, **Attach Prop**
