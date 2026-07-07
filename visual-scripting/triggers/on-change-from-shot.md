---
description: >-
  Trigger event that runs when a specific Shot Camera stops being the active shot
  on a Main Camera.
icon: camera
---

# On Change from Shot

**Type:** Trigger event  
**Category:** Cameras → On Change from Shot  
**Component:** [Trigger](../triggers.md)

Runs when the specified **Shot Camera** **stops being active** — another shot replaces it on the Main Camera. Use this for **exit** logic: hide UI, stop audio, restore gameplay settings, or save state when leaving an angle.

For system context, see [Cameras (Core Functionality)](../../core-functionality/cameras.md). Pair with [On Change to Shot](on-change-to-shot.md) on the same shot for complete enter/exit handling.

---

## Adding this event

1. Add a **Trigger** component to a GameObject (often the same object that holds **On Change to Shot** for this shot).
2. Open the event picker → **Cameras** → **On Change from Shot**.
3. Set **Camera Shot** to the Shot Camera that is **leaving**.
4. Add **Actions** for cleanup behavior.

---

## Inspector fields

| Field | Default | Purpose |
| ----- | ------- | ------- |
| **Camera Shot** | (instance) | The Shot Camera to watch. Must resolve to a GameObject with a **Shot Camera** component. |

---

## When it runs

- When the Main Camera switches **away from** this shot to a different shot.
- During `ChangeToShot`, **before** the new shot's [On Change to Shot](on-change-to-shot.md) fires.
- Fires for both **cuts** and **transitions**.

### Order relative to other camera triggers

On a switch from Shot A → Shot B:

1. **On Change from Shot** on Shot A  
2. [On Change to Shot](on-change-to-shot.md) on Shot B  
3. [On Camera Change](on-camera-change.md) on the Main Camera  

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger component |

---

## Example uses

| Scenario | Actions on exit |
| -------- | --------------- |
| Dialogue close-up | Hide subtitles, restore HUD |
| Aim / inspection camera | Restore time scale, remove hints |
| Boss intro angle | End sting, hand control back to player |
| Photo mode | Disable free-look UI, re-enable movement |

---

## Notes

- **On Change from Shot** = teardown; [On Change to Shot](on-change-to-shot.md) = setup. Use both on the same **Camera Shot** reference for symmetric behavior.
- [On Camera Change](on-camera-change.md) is better for one-shot global reactions that do not depend on which shot was left.
- Invalid **Camera Shot** reference → event never fires (silent).

---

## Related

- [Cameras (Core Functionality)](../../core-functionality/cameras.md) — camera system overview
- [Camera Triggers](../cameras.md) — all camera trigger events
- [On Change to Shot](on-change-to-shot.md) — enter counterpart
- [On Camera Change](on-camera-change.md) — any switch on the Main Camera
- [Change to Shot](../instructions.md) — instruction that performs a shot switch
