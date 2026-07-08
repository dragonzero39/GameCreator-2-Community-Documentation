---
description: >-
  Character Trigger events in Game Creator 2 — react to player switching, model
  swaps, death, and revival on a Character.
icon: user
---

# Character Triggers

Character triggers at the **Characters** category root are **Trigger** component events that fire on a **Character's** lifecycle — when control passes between Player and NPC, when the model swaps, or when the Character dies or revives.

For how the Character component, kernel units, and Player/NPC rules work, read [Characters (Core Functionality)](../core-functionality/characters.md) first. Combat, navigation, and ragdoll triggers are listed separately on [Triggers](triggers.md).

---

## The Trigger component

All entries on this page are **events** you add to a **Trigger** component:

1. Add **Trigger** to the **Character GameObject** (recommended) or a manager that listens for that Character.
2. Open the event picker → **Characters** (root level, not Combat / Navigation / Ragdoll).
3. Choose an event — none of these require extra inspector fields beyond the event type.
4. Add **Actions** that run when the event fires.

**Self** refers to the GameObject that owns the Trigger. When the Trigger lives on the Character, **Self** is that Character — use **Self** in Actions that need a Character reference.

{% hint style="warning" %}
These events fire for **this Character only**. A Trigger on Character A does not receive **On Die** when Character B dies. Place triggers on each Character that needs its own logic, or use a manager with module-specific events for global game-over handling.
{% endhint %}

---

## Choosing the right trigger

| Need | Use |
| ---- | --- |
| Setup when this Character **gains** Player control | [On Become Player](triggers/on-become-player.md) |
| Teardown when this Character **loses** Player control | [On Become NPC](triggers/on-become-npc.md) |
| Refresh equipment, collider, or UI after **model swap** | [On Change Model](triggers/on-change-model.md) |
| Death VFX, disable input, drop loot | [On Die](triggers/on-die.md) |
| Restore HUD, re-enable interaction after **revival** | [On Revive](triggers/on-revive.md) |

### Comparison

| | On Become Player | On Become NPC | On Change Model | On Die | On Revive |
| -- | -- | -- | -- | -- | -- |
| **Fires when** | Becomes Player | Stops being Player | Model swapped | Enters death state | Leaves death state |
| **Typical cause** | **Change Player** instruction | **Change Player** (previous Player) | **Change Model** instruction | **Kill Character**, Stats, combat | **Revive Character** |
| **Best for** | Camera/UI bind, input profile | Save state, hide player HUD | Resize collider, refresh props | Local death feedback | Stand-up FX, re-enable control |

### Firing order on player switch (A → B)

When **Change Player** transfers control from Character A to Character B:

1. [On Become NPC](triggers/on-become-npc.md) on **Character A**
2. [On Become Player](triggers/on-become-player.md) on **Character B**

---

## Character trigger reference

| Trigger | Summary |
| ------- | ------- |
| [On Become Player](triggers/on-become-player.md) | Runs when this Character becomes the Player. |
| [On Become NPC](triggers/on-become-npc.md) | Runs when this Character stops being the Player. |
| [On Change Model](triggers/on-change-model.md) | Runs when this Character's visible model is swapped. |
| [On Die](triggers/on-die.md) | Runs when this Character enters the death state. |
| [On Revive](triggers/on-revive.md) | Runs when this Character revives from death. |

---

## Common patterns

**Party member swap**

- On each party Character: **On Become Player** → enable selection ring, bind follow camera.
- Same Character: **On Become NPC** → disable ring, switch to AI follow.

**Death and revival pair**

- **On Die** → play death animation trigger, disable **Is Controllable**, spawn loot.
- **On Revive** → restore health UI, clear ragdoll, play respawn VFX.

**Model swap for equipment**

- **Change Model** after equipping armor → **On Change Model** → resize Character height, reattach props.

For ragdoll enter/exit, use **On Start Ragdoll** / **On Recover Ragdoll** under the Ragdoll subcategory on [Triggers](triggers.md). **Kill Character** may activate ragdoll without you wiring those events manually.

---

## Related

- [Characters (Core Functionality)](../core-functionality/characters.md) — Character component, kernel, Player/NPC, death
- [Triggers](triggers.md) — full trigger catalog (combat, navigation, ragdoll)
- [Instructions](instructions.md) — **Change Player**, **Kill Character**, **Revive Character**, **Change Model**
