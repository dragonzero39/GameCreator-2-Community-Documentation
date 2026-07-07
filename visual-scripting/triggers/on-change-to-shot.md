---
description: >-
  Trigger event that runs when a specific Shot Camera becomes the active shot on
  a Main Camera.
icon: camera
---

# On Change to Shot

**Type:** Trigger event  
**Category:** Cameras → On Change to Shot  
**Component:** [Trigger](../triggers.md)

Runs when the specified **Shot Camera** becomes the **active shot** on a Main Camera. Use this for **enter** logic tied to one angle — show UI, start audio, enable prompts, or set variables when the player (or cinematic) moves into that shot.

For system context, see [Cameras (Core Functionality)](../../core-functionality/cameras.md). For cleanup when leaving the same shot, pair with [On Change from Shot](on-change-from-shot.md).

---

## Adding this event

1. Add a **Trigger** component to a GameObject. Common placements:
   - On the **Shot Camera** GameObject itself
   - On a scene **manager** with the shot referenced in the inspector
2. Open the event picker → **Cameras** → **On Change to Shot**.
3. Set **Camera Shot** to the Shot Camera you want to watch.
4. Add **Actions** for enter behavior.

---

## Inspector fields

| Field | Default | Purpose |
| ----- | ------- | ------- |
| **Camera Shot** | (instance) | The Shot Camera to watch. Drag from the hierarchy or use a variable/getter. Must resolve to a GameObject with a **Shot Camera** component. |

---

## When it runs

- When `ChangeToShot` activates **this** shot on a Main Camera.
- After the **previous** shot is deactivated and **before** the new shot's first frame of blending (same moment the shot's `OnEnableShot` runs).
- Fires for both **cuts** and **transitions** — this event does not distinguish duration.
- Fires when switching **to** this shot from any other shot (or from no active shot).

### Order relative to other camera triggers

On a switch from Shot A → Shot B:

1. [On Change from Shot](on-change-from-shot.md) on Shot A  
2. **On Change to Shot** on Shot B  
3. [On Camera Change](on-camera-change.md) on the Main Camera  

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger component |

---

## Example uses

| Scenario | Actions on enter |
| -------- | ---------------- |
| Dialogue close-up | Show subtitle UI, hide HUD |
| Aim / inspection camera | Slow time, display interaction hints |
| Boss intro angle | Play sting audio, trigger animation signal |
| Photo mode | Enable free-look UI, disable character movement |

Pair each setup with [On Change from Shot](on-change-from-shot.md) on the **same** Camera Shot reference to tear down when leaving.

---

## Notes

- Use [On Camera Change](on-camera-change.md) on the Main Camera instead if the same Actions should run for **every** shot switch.
- Invalid **Camera Shot** reference → event never fires (silent).

---

## Related

- [Cameras (Core Functionality)](../../core-functionality/cameras.md) — camera system overview
- [Camera Triggers](../cameras.md) — all camera trigger events
- [On Change from Shot](on-change-from-shot.md) — exit counterpart
- [On Camera Change](on-camera-change.md) — any switch on the Main Camera
- [Change to Shot](../instructions.md) — instruction that performs a shot switch
