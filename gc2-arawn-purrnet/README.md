---
description: >-
  Arawn PurrNet integration for Game Creator 2 Networking Layer — scene wizard,
  transport bridges, and module replication (third-party).
icon: plug
---

# Arawn PurrNet Integration

{% hint style="danger" %}
**Third-party extension.** Requires the [Arawn Agnostic Networking Layer](../gc2-arawn-agnostic-networking/README.md) and a licensed **PurrNet** install. Not official Game Creator 2.
{% endhint %}

---

## What this integration is

The **PurrNet transport** is the first-class networking stack shipped with the Arawn GC2 Networking Layer. It implements **NetworkTransportBridge** and module-specific PurrNet bridges so GC2 characters, variables, animation, and optional modules replicate over PurrNet.

Key pieces:

- **PurrNetTransportBridge** — core input/state packet flow
- **Module bridges** — Stats, Inventory, Melee, Shooter, Quests, Dialogue, Traversal, Abilities (per installed GC2 modules)
- **PurrNet Scene Setup Wizard** — `Game Creator > Networking Layer > PurrNet Scene Setup Wizard`
- **Demo UI** — host/join overlays, optional chat box, player spawner helpers

Requires the agnostic layer for managers, session profiles, and authority rules.

---

## How it is typically used

1. Install agnostic networking layer + PurrNet + desired GC2 modules.
2. Open **PurrNet Scene Setup Wizard** and walk through Project → Modules → Transport → Core → Scene → Review.
3. Assign a player prefab; enable module bridges matching your game.
4. Host/join via wizard-generated UI or your own menu.
5. Tune **NetworkSessionProfile** for tick rate and interpolation.

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Wizard, bridges, packet flow, ownership, channels |
| [**Arawn PurrNet Demos**](gc2-arawn-purrnet-demos/overview.md) | Demo scenes and wizard-generated setups |
| [**Code**](code/overview.md) | PurrNet bridge extension, custom transport tuning |
| [**Visual Scripting**](visual-scripting/triggers.md) | Network VS entries (when applicable) |

---

## Related spaces

- [Arawn Agnostic Networking Layer](../gc2-arawn-agnostic-networking/README.md) — transport-independent core
- [Arawn Photon Integration](../gc2-arawn-photon/README.md) — alternative transport

## Documentation status

**Scaffold only.** Document from your licensed local install; do not commit Arawn or PurrNet source.
