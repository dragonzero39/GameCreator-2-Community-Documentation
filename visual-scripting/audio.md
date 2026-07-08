---
description: >-
  Audio Trigger events in Game Creator 2 — react to channel and master volume
  changes for settings UI and gameplay feedback.
icon: volume-high
---

# Audio Triggers

Audio triggers are **Trigger** component events in the **Audio** category. They let you run Actions when a **volume level** changes — without polling variables every frame or wiring custom C#.

For how channels, master volume, and playback work, read [Audio (Core Functionality)](../core-functionality/audio.md) first. This page links to each audio volume trigger and how they fit together.

---

## The Trigger component

All entries on this page are **events** you add to a **Trigger** component:

1. Add **Trigger** to any GameObject (settings manager, UI root, persistent systems object, etc.).
2. Open the event picker → **Audio**.
3. Choose a volume event — no additional inspector fields are required.
4. Add **Actions** that run when that channel's volume changes.

**Self** always refers to the GameObject that owns the Trigger — not an AudioSource or Character unless you put the Trigger on that object.

{% hint style="info" %}
These triggers listen **globally** for volume updates on their channel. They do not need a reference to an Audio Clip or AudioSource.
{% endhint %}

---

## Choosing the right trigger

| Need | Use |
| ---- | --- |
| Sync a **master mute** slider or icon | [On Change Master Volume](triggers/on-change-master-volume.md) |
| Update **ambient** slider label or save preference | [On Change Ambient Volume](triggers/on-change-ambient-volume.md) |
| React to **music** level (ducking UI, achievements) | [On Change Music Volume](triggers/on-change-music-volume.md) |
| Feedback when **SFX** volume changes | [On Change Sound Effects Volume](triggers/on-change-sound-effects-volume.md) |
| Subtitle size or accessibility when **speech** changes | [On Change Speech Volume](triggers/on-change-speech-volume.md) |
| UI sound preview when **UI** channel changes | [On Change UI Volume](triggers/on-change-ui-volume.md) |

### Comparison

| | Master | Ambient | Music | Sound Effects | Speech | UI |
| -- | -- | -- | -- | -- | -- | -- |
| **Scope** | All channels | Ambient only | Music only | SFX only | Speech only | UI only |
| **Typical source** | Settings menu, pause mute | Environment slider | BGM slider | Effects slider | Voice slider | Interface slider |
| **Fires when** | Master volume value changes | Ambient volume value changes | Music volume value changes | SFX volume value changes | Speech volume value changes | UI volume value changes |

### What does *not* cross-fire

Changing **Master volume** fires **On Change Master Volume** only — individual channel triggers do **not** fire unless that channel's own volume instruction runs. Changing **Music volume** does not fire the Master or SFX triggers.

---

## Audio trigger reference

| Trigger | Summary |
| ------- | ------- |
| [On Change Master Volume](triggers/on-change-master-volume.md) | Runs when master volume (global multiplier) changes. |
| [On Change Ambient Volume](triggers/on-change-ambient-volume.md) | Runs when the Ambient channel volume changes. |
| [On Change Music Volume](triggers/on-change-music-volume.md) | Runs when the Music channel volume changes. |
| [On Change Sound Effects Volume](triggers/on-change-sound-effects-volume.md) | Runs when the Sound Effects channel volume changes. |
| [On Change Speech Volume](triggers/on-change-speech-volume.md) | Runs when the Speech channel volume changes. |
| [On Change UI Volume](triggers/on-change-ui-volume.md) | Runs when the UI channel volume changes. |

---

## Common patterns

**Settings menu persistence**

- UI slider → **Change Music Volume** (with short **Transition**).
- Same scene: **On Change Music Volume** → save value to a **Global Variable** or trigger **Save Game**.

**Master mute toggle**

- Button → **Change Master Volume** to `0` or previous stored value.
- **On Change Master Volume** → swap mute icon sprite on the button.

**Accessibility feedback**

- **On Change Speech Volume** → show temporary on-screen confirmation for hearing-accessibility options.

Avoid duplicating logic: one trigger per channel on a central **Audio Settings** object is easier to maintain than scattering the same event on multiple UI widgets.

---

## Related

- [Audio (Core Functionality)](../core-functionality/audio.md) — channels, playback, master volume
- [Triggers](triggers.md) — full trigger catalog by category
- [Instructions](instructions.md) — **Change … Volume**, **Play Music**, and other audio instructions
