---
description: Details and information for GC2 Core Trigger Functionality
icon: star
---

# Triggers

Trigger events start a visual scripting graph when something happens in your game. Add a **Trigger** component, pick an **Event** from the category list, then attach **Actions** that run when the event fires.

## Documented trigger categories

These categories have dedicated overview pages and per-event reference docs. More categories will follow the same pattern.

| Category | Overview | Core Functionality |
| -------- | -------- | ------------------ |
| **Cameras** | [Camera Triggers](cameras.md) | [Cameras](../core-functionality/cameras.md) |
| **Audio** | [Audio Triggers](audio.md) | [Audio](../core-functionality/audio.md) |
| **Characters** | [Character Triggers](characters.md) | [Characters](../core-functionality/characters.md) |

Jump to catalog sections: [Core Camera Triggers](#core-camera-triggers) · [Core Audio Triggers](#core-audio-triggers) · [Core Character Triggers](#core-character-triggers)

---

## Core Camera Triggers

Camera events react when the [camera system](../core-functionality/cameras.md) switches shots. See [Camera Triggers](cameras.md) for an overview, or open each event below.

| Trigger | Description |
| ------- | ----------- |
| [On Camera Change](triggers/on-camera-change.md) | Any shot switch on a Main Camera (filter by cut or transition) |
| [On Change to Shot](triggers/on-change-to-shot.md) | A specific Shot Camera becomes active |
| [On Change from Shot](triggers/on-change-from-shot.md) | A specific Shot Camera becomes inactive |

<details>

<summary>Core Audio Triggers</summary>

Volume events react when an audio channel or master level changes. See [Audio Triggers](audio.md) and [Audio (Core Functionality)](../core-functionality/audio.md).

| Trigger | Description |
| ------- | ----------- |
| [On Change Ambient Volume](triggers/on-change-ambient-volume.md) | Ambient channel volume changes |
| [On Change Master Volume](triggers/on-change-master-volume.md) | Master volume changes (all channels) |
| [On Change Music Volume](triggers/on-change-music-volume.md) | Music channel volume changes |
| [On Change Sound Effects Volume](triggers/on-change-sound-effects-volume.md) | Sound Effects channel volume changes |
| [On Change Speech Volume](triggers/on-change-speech-volume.md) | Speech channel volume changes |
| [On Change UI Volume](triggers/on-change-ui-volume.md) | UI channel volume changes |

</details>

<details>

<summary>Core Character Triggers</summary>

Root-level character lifecycle events. See [Character Triggers](characters.md) and [Characters (Core Functionality)](../core-functionality/characters.md).

| Trigger | Description |
| ------- | ----------- |
| [On Become NPC](triggers/on-become-npc.md) | This Character stops being the Player |
| [On Become Player](triggers/on-become-player.md) | This Character becomes the Player |
| [On Change Model](triggers/on-change-model.md) | This Character's model is swapped |
| [On Die](triggers/on-die.md) | This Character enters death state |
| [On Revive](triggers/on-revive.md) | This Character revives from death |

</details>

<details>

<summary>Core Character Combat Triggers</summary>

On Defense Change

On Dodge

On Invincibility Change

On Poise Break

On Poise Change

On Target Change

</details>

<details>

<summary>Core Character Navigation Triggers</summary>

On Dash

On Jump

On Land

On Step

</details>

<details>

<summary>Core  Character Ragdoll Triggers</summary>

On Recover Ragdoll

On Start Ragdoll

</details>

<details>

<summary>Core Input Truggers</summary>

On Cursor Click

On Input Button

On Input Flick

On Touch

</details>

<details>

<summary>Core Lifecycle Triggers</summary>

On App Focus

On App Pause

On App Quit

On Become invisible

On Become Visible

On Disable

On Enable

On Fixed Update

On Interval

On Invoke

On Late Update

On Start

On Update

</details>

<details>

<summary>Core Interactive Triggers</summary>

On Blur

On Focus

On Interact

</details>
