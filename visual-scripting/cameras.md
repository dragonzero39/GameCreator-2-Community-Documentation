---
description: >-
  Camera Trigger events in Game Creator 2 — react to shot cuts, transitions,
  and per-shot activation.
icon: camera
---

# Camera Triggers

Camera triggers are **Trigger** component events in the **Cameras** category. They let you run Actions when the [camera system](../core-functionality/cameras.md) switches shots — without writing custom C#.

For how Main Camera, Shot Cameras, cuts, and transitions work, read [Cameras (Core Functionality)](../core-functionality/cameras.md) first. This page links to each camera trigger and how they fit together.

---

## The Trigger component

All entries on this page are **events** you add to a **Trigger** component:

1. Add **Trigger** to any GameObject (manager, UI root, the Shot Camera itself, etc.).
2. Open the event picker → **Cameras**.
3. Choose an event and configure its inspector fields.
4. Add **Actions** that run when the event fires.

**Self** always refers to the GameObject that owns the Trigger — not the Main Camera or Shot Camera unless you put the Trigger on that object.

{% hint style="warning" %}
If a trigger's **Camera** or **Camera Shot** reference does not resolve to the correct component, the event subscribes to nothing and **never runs**. No error appears in Play Mode.
{% endhint %}

---

## Choosing the right trigger

| Need | Use |
| ---- | --- |
| React to **any** shot change on a Main Camera | [On Camera Change](triggers/on-camera-change.md) |
| React only to **instant** cuts or only to **blended** transitions | [On Camera Change](triggers/on-camera-change.md) → set **When** |
| Run setup when **entering** a specific angle | [On Change to Shot](triggers/on-change-to-shot.md) |
| Run cleanup when **leaving** a specific angle | [On Change from Shot](triggers/on-change-from-shot.md) |

### Comparison

| | On Camera Change | On Change to Shot | On Change from Shot |
| -- | -- | -- | -- |
| **Watches** | Main Camera | One Shot Camera | One Shot Camera |
| **Fires when** | Any shot switch on that camera | That shot becomes active | That shot becomes inactive |
| **Cut vs transition** | Filterable | Both | Both |
| **Best for** | Global camera reactions | Entering a specific angle | Leaving a specific angle |

### Firing order on one switch (Shot A → Shot B)

1. [On Change from Shot](triggers/on-change-from-shot.md) on **Shot A**
2. [On Change to Shot](triggers/on-change-to-shot.md) on **Shot B**
3. [On Camera Change](triggers/on-camera-change.md) on the **Main Camera**

---

## Camera trigger reference

| Trigger | Summary |
| ------- | ------- |
| [On Camera Change](triggers/on-camera-change.md) | Runs when the selected Main Camera switches to a different shot. |
| [On Change to Shot](triggers/on-change-to-shot.md) | Runs when the specified Shot Camera becomes active. |
| [On Change from Shot](triggers/on-change-from-shot.md) | Runs when the specified Shot Camera stops being active. |

---

## Common patterns

**Cinematic enter / exit on one shot**

- On the shot (or a manager): **On Change to Shot** → disable player input, show letterbox UI.
- Same shot: **On Change from Shot** → restore input, hide letterbox.

**Global reaction to any cinematic blend**

- On a manager: **On Camera Change** → **When** = **On Transition** → crossfade music or show a cutscene overlay.

**Gameplay snap-cuts only**

- On a manager: **On Camera Change** → **When** = **On Cut** → brief feedback (shake, hit-stop).

Avoid duplicating logic: use **On Camera Change** once for global behavior; use shot-specific triggers only when that shot needs unique setup or teardown.

---

## Related

- [Cameras (Core Functionality)](../core-functionality/cameras.md) — Main Camera, Shot Cameras, cuts, transitions
- [Triggers](triggers.md) — full trigger catalog by category
- [Instructions](instructions.md) — **Change to Shot** and shot property instructions
