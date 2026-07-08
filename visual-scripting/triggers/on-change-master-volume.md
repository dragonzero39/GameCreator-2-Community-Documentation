---
description: >-
  Trigger event that runs when the Game Creator 2 master volume level changes.
icon: volume-high
---

# On Change Master Volume

**Type:** Trigger event  
**Category:** Audio → On Change Master Volume  
**Component:** [Trigger](../triggers.md)

Runs when **master volume** changes. Master volume is the global multiplier applied to every audio channel (Ambient, Music, Sound Effects, Speech, UI). Use this for mute-all toggles, settings-menu sync, or accessibility feedback.

For how master volume relates to channels, see [Audio (Core Functionality)](../../core-functionality/audio.md). For other volume events, see [Audio Triggers](../audio.md).

---

## Adding this event

1. Add a **Trigger** component to a GameObject (settings manager, UI root, or persistent systems object).
2. Open the event picker → **Audio** → **On Change Master Volume**.
3. Add **Actions** that should run when master volume updates.

This event has **no inspector fields** — it listens globally for master volume changes.

---

## When it runs

- When **Change Master Volume** updates the master level (instant or at the start of a transitioned change).
- When any other system or instruction commits a new master volume value.
- **Once per volume update** — not every frame during a fade unless the underlying system emits multiple commits.

Does **not** fire when only an individual channel volume changes (Music, SFX, etc.) unless master itself also changes.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger component |

The new volume value is **not** passed into the graph automatically. Read the current level from a **Global Variable** you set alongside the slider, or add a follow-up instruction that queries your saved settings.

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| Mute icon toggle | Swap sprite when master hits `0` |
| Save settings | Write volume to Global Variable → **Save Game** |
| Pause menu ducking | Detect master drop → dim non-essential UI sounds |

---

## Notes

- Pair with **Change Master Volume** on UI sliders; the trigger confirms the value was applied.
- For per-channel UI, use the matching **On Change … Volume** trigger instead.
- Channel-specific triggers do **not** fire when only master changes.

---

## Related

- [Audio (Core Functionality)](../../core-functionality/audio.md) — volume system overview
- [Audio Triggers](../audio.md) — all audio volume trigger events
- [On Change Music Volume](on-change-music-volume.md) · [On Change Sound Effects Volume](on-change-sound-effects-volume.md)
