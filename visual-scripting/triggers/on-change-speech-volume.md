---
description: >-
  Trigger event that runs when the Game Creator 2 Speech channel volume changes.
icon: volume-high
---

# On Change Speech Volume

**Type:** Trigger event  
**Category:** Audio → On Change Speech Volume  
**Component:** [Trigger](../triggers.md)

Runs when the **Speech** channel volume changes. Speech carries character dialogue — one clip per character at a time, often with spatial options. Use this for voice/subs settings, accessibility prompts, or saving dialogue volume preferences.

For channel context, see [Audio (Core Functionality)](../../core-functionality/audio.md). For other volume events, see [Audio Triggers](../audio.md).

---

## Adding this event

1. Add a **Trigger** component to a manager or settings UI object.
2. Open the event picker → **Audio** → **On Change Speech Volume**.
3. Add **Actions** for when Speech volume updates.

No inspector fields — global listener for the Speech channel.

---

## When it runs

- When **Change Speech Volume** commits a new level.
- When load/startup logic restores Speech volume through GC2 instructions.
- Does **not** fire when **Play Speech** starts or stops unless volume also changes.

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger component |

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| Voice slider | Update label; optionally replay last line for preview |
| Subtitle pairing | When Speech volume is low, suggest enabling subtitles |
| Save settings | Write Speech level to Global Variable |

---

## Notes

- Dialogue modules (e.g. GC2 Dialogue) still use the Speech channel for voice lines — this trigger helps centralize volume UX.
- **Stop Speech On Game Object** affects playback, not channel volume.

---

## Related

- [Audio (Core Functionality)](../../core-functionality/audio.md) — Speech channel
- [Audio Triggers](../audio.md) — all audio volume trigger events
- [On Change UI Volume](on-change-ui-volume.md)
