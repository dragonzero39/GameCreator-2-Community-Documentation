---
description: >-
  Trigger event that runs when the Game Creator 2 Music channel volume changes.
icon: volume-high
---

# On Change Music Volume

**Type:** Trigger event  
**Category:** Audio → On Change Music Volume  
**Component:** [Trigger](../triggers.md)

Runs when the **Music** channel volume changes. Music carries background and thematic BGM. Use this for settings menus, dynamic mixing feedback, or achievements tied to audio preferences.

For channel context, see [Audio (Core Functionality)](../../core-functionality/audio.md). For other volume events, see [Audio Triggers](../audio.md).

---

## Adding this event

1. Add a **Trigger** component to a manager or settings UI object.
2. Open the event picker → **Audio** → **On Change Music Volume**.
3. Add **Actions** for when Music volume updates.

No inspector fields — global listener for the Music channel.

---

## When it runs

- When **Change Music Volume** commits a new level (with or without **Transition** fade).
- When startup or load logic restores Music volume through GC2 instructions.
- Does **not** fire when only other channels or master volume change (unless Music volume is also updated).

---

## Outputs and context

| Symbol | Meaning |
| ------ | ------- |
| **Self** | The GameObject that owns the Trigger component |

---

## Example uses

| Scenario | Actions |
| -------- | ------- |
| BGM slider sync | Update numeric label next to Music slider |
| Persist settings | Save Music level to Global Variable on every change |
| Dynamic mix | Trigger UI pulse when player maxes Music during boss fight |

---

## Notes

- **Play Music**, **Stop Music**, and **Fade All Music** change playback, not necessarily volume — they do not fire this event unless volume instructions also run.
- For muting all audio, prefer [On Change Master Volume](on-change-master-volume.md).

---

## Related

- [Audio (Core Functionality)](../../core-functionality/audio.md) — Music channel and playback
- [Audio Triggers](../audio.md) — all audio volume trigger events
- [On Change Master Volume](on-change-master-volume.md)
