---
description: >-
  Trigger event that runs when the Game Creator 2 Ambient channel volume changes.
icon: volume-high
---

# On Change Ambient Volume

**Type:** Trigger event  
**Category:** Audio → On Change Ambient Volume  
**Component:** [Trigger](../triggers.md)

Runs when the **Ambient** channel volume changes. Ambient carries looping environmental audio (wind, crowds, machinery). Use this to sync settings UI, persist preferences, or trigger gameplay reactions when environmental loudness changes.

For channel context, see [Audio (Core Functionality)](../../core-functionality/audio.md). For other volume events, see [Audio Triggers](../audio.md).

---

## Adding this event

1. Add a **Trigger** component to a manager or settings UI object.
2. Open the event picker → **Audio** → **On Change Ambient Volume**.
3. Add **Actions** for when Ambient volume updates.

No inspector fields — global listener for Ambient channel volume.

---

## When it runs

- When **Change Ambient Volume** commits a new level.
- When load/save or startup logic restores Ambient volume through GC2 audio instructions.
- Does **not** fire for Music, SFX, Speech, or UI volume changes alone.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger component |

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| Settings slider label | Update percentage text on the Ambient slider |
| Save on change | Store value in Global Variable |
| Stealth hint | Lower Ambient in options → show "easier to hear enemies" tip |

---

## Notes

- **Play Ambient** / **Stop Ambient** do not fire this event — only volume **level** changes do.
- Master volume changes affect perceived loudness but fire [On Change Master Volume](on-change-master-volume.md), not this trigger, unless Ambient volume is also explicitly changed.

---

## Related

- [Audio (Core Functionality)](../../core-functionality/audio.md) — Ambient channel and playback
- [Audio Triggers](../audio.md) — all audio volume trigger events
- [On Change Master Volume](on-change-master-volume.md)
