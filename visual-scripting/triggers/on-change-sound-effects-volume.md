---
description: >-
  Trigger event that runs when the Game Creator 2 Sound Effects channel volume
  changes.
icon: volume-high
---

# On Change Sound Effects Volume

**Type:** Trigger event  
**Category:** Audio → On Change Sound Effects Volume  
**Component:** [Trigger](../triggers.md)

Runs when the **Sound Effects** (SFX) channel volume changes. This channel handles one-shot gameplay sounds — impacts, pickups, weapons, doors. Use this for settings UI, save data, or tutorials about combat audio.

For channel context, see [Audio (Core Functionality)](../../core-functionality/audio.md). For other volume events, see [Audio Triggers](../audio.md).

---

## Adding this event

1. Add a **Trigger** component to a manager or settings UI object.
2. Open the event picker → **Audio** → **On Change Sound Effects Volume**.
3. Add **Actions** for when SFX volume updates.

No inspector fields — global listener for the Sound Effects channel.

---

## When it runs

- When **Change Sound Effects Volume** commits a new level.
- When load/startup logic restores SFX volume through GC2 instructions.
- Does **not** fire for Music, Ambient, Speech, UI, or Master-only changes.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger component |

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| SFX slider | Update UI and play a sample **Play Sound Effect** for preview |
| Accessibility | Show warning if SFX is set to `0` during combat tutorial |
| Auto-save | Persist SFX level to save slot |

---

## Notes

- Spatial **Play Sound Effect** calls are affected by this channel's volume but do not fire the trigger — only explicit volume changes do.
- GC2 applies slight pitch/speed variation to repeated SFX independently of volume triggers.

---

## Related

- [Audio (Core Functionality)](../../core-functionality/audio.md) — Sound Effects channel
- [Audio Triggers](../audio.md) — all audio volume trigger events
- [On Change Master Volume](on-change-master-volume.md)
