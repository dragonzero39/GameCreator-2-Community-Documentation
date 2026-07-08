---
description: >-
  Trigger event that runs when the Game Creator 2 UI channel volume changes.
icon: volume-high
---

# On Change UI Volume

**Type:** Trigger event  
**Category:** Audio → On Change UI Volume  
**Component:** [Trigger](../triggers.md)

Runs when the **UI** channel volume changes. UI sounds cover interface feedback — button clicks, hovers, menu transitions, craft confirmations. Use this for settings sliders, save data, or playing a preview click when the user adjusts UI loudness.

For channel context, see [Audio (Core Functionality)](../../core-functionality/audio.md). For other volume events, see [Audio Triggers](../audio.md).

---

## Adding this event

1. Add a **Trigger** component to a manager or settings UI object.
2. Open the event picker → **Audio** → **On Change UI Volume**.
3. Add **Actions** for when UI volume updates.

No inspector fields — global listener for the UI channel.

---

## When it runs

- When **Change UI Volume** commits a new level.
- When load/startup logic restores UI volume through GC2 instructions.
- Does **not** fire for other channels or master-only changes.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger component |

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| UI slider preview | **Play UI Sound** sample after volume change |
| Settings persistence | Save UI level to Global Variable |
| Menu polish | Brief haptic or visual pulse when UI volume crosses threshold |

---

## Notes

- **Play UI Sound** uses this channel's volume but does not fire the trigger by itself.
- UI volume is independent of Music — players often want quiet BGM but audible interface feedback.

---

## Related

- [Audio (Core Functionality)](../../core-functionality/audio.md) — UI channel
- [Audio Triggers](../audio.md) — all audio volume trigger events
- [On Change Master Volume](on-change-master-volume.md)
