---
description: >-
  Trigger event that runs when a Main Camera switches to a different Shot
  Camera — with optional cut or transition filtering.
icon: camera
---

# On Camera Change

**Type:** Trigger event  
**Category:** Cameras → On Camera Change  
**Component:** [Trigger](../triggers.md)

Runs when the selected **Main Camera** switches to a different **Shot Camera**. Use this when you need a single reaction point for any shot change on a camera rig — UI fades, input locks, audio stingers, or cutscene boundaries.

For how shots, cuts, and transitions work under the hood, see [Cameras (Core Functionality)](../../core-functionality/cameras.md). For shot-specific enter/exit logic, see [On Change to Shot](on-change-to-shot.md) and [On Change from Shot](on-change-from-shot.md).

---

## Adding this event

1. Add a **Trigger** component to a GameObject (a manager, UI root, or any object in the scene).
2. In the Trigger's event slot, open the picker → **Cameras** → **On Camera Change**.
3. Set **Camera** to the Main Camera you want to watch (default: Main Camera).
4. Set **When** to match how the switch happens (see below).
5. Add **Actions** that should run when the event fires.

---

## Inspector fields

| Field | Default | Purpose |
| ----- | ------- | ------- |
| **Camera** | Main Camera | The `TCamera` rig to listen to. Must reference a GameObject with a **Main Camera** component. |
| **When** | Any Change | Which kind of switch triggers the event. |

### When options

| Value | Fires on |
| ----- | -------- |
| **Any Change** | Both instant cuts and blended transitions |
| **On Cut** | Instant switches only (duration ≈ 0) |
| **On Transition** | Blended switches only (duration > 0) |

{% hint style="info" %}
**Cut** = the Main Camera snaps to the new shot immediately. **Transition** = the Main Camera blends over time with easing. These map directly to the **Duration** field on the [Change to Shot](../instructions.md) instruction.
{% endhint %}

---

## When it runs

- After a shot change is **committed** on the chosen Main Camera.
- **Once per switch**, at the **start** of the cut or transition — not when a blend finishes.
- Does **not** fire on scene load unless something actually changes shots while the Trigger is enabled.

Something must cause the switch — typically the **Change to Shot** instruction, another visual scripting graph, or custom code.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger component |

The new or previous Shot Camera is **not** passed into the graph automatically. Use Game Object getters in your Actions if you need to reference the active shot.

---

## Example uses

| Scenario | Configuration |
| -------- | ------------- |
| Fade UI on any camera change | **When** = Any Change → Actions: fade canvas |
| Cinematic transitions only | **When** = On Transition → Actions: play music swell, show letterbox |
| Gameplay snap-cuts only | **When** = On Cut → Actions: brief camera shake or hit-stop |
| Cutscene boundary | **When** = On Transition → Actions: disable player input |

---

## Notes

- Pair with [On Change to Shot](on-change-to-shot.md) / [On Change from Shot](on-change-from-shot.md) when you need per-shot setup and teardown; use **On Camera Change** when one rule should apply to every switch.
- Invalid **Camera** reference → event never fires (silent).

---

## Related

- [Cameras (Core Functionality)](../../core-functionality/cameras.md) — camera system overview
- [Camera Triggers](../cameras.md) — all camera trigger events
- [On Change to Shot](on-change-to-shot.md) · [On Change from Shot](on-change-from-shot.md)
- [Change to Shot](../instructions.md) — instruction that performs a shot switch
