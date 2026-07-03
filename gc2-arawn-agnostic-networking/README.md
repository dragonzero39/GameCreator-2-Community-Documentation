---
description: >-
  Arawn Agnostic Networking Layer for Game Creator 2 — transport-independent
  multiplayer core (third-party).
icon: network-wired
---

# Arawn Agnostic Networking Layer

{% hint style="danger" %}
**Third-party extension.** The Arawn Networking Layer is **not** official Game Creator 2 from Catsoft Studios. It is a separate product that adds multiplayer on top of licensed GC2 modules. Licensing, support, and updates come from Arawn — not Game Creator.
{% endhint %}

---

## What this layer is

The **Arawn Agnostic Networking Layer** (`NetworkingLayerForGC2`) is a **transport-independent** multiplayer stack for Game Creator 2. It sits between GC2 gameplay systems and your chosen netcode (PurrNet, Photon, or a custom transport).

It provides:

- **NetworkTransportBridge** — abstract contract your transport implements
- **Core managers** — security, characters, animation, motion, variables
- **Module bridges** — optional replication for Inventory, Stats, Melee, Shooter, Quests, Dialogue, Traversal, Abilities (when installed)
- **Session profiles** — tick rate, broadcast rates, interpolation tuning
- **Ownership and authority** — server-authoritative input and state flow

Transport-specific setup lives in sibling spaces:

| Space | Transport |
|-------|-----------|
| [Arawn PurrNet Integration](../gc2-arawn-purrnet/README.md) | PurrNet (included first-class integration) |
| [Arawn Photon Integration](../gc2-arawn-photon/README.md) | Photon (when installed) |

---

## How it is typically used

1. Install the agnostic networking layer and at least one **transport integration**.
2. Add core networking managers to your scene (or use a transport wizard).
3. Implement or enable a **NetworkTransportBridge** for your netcode stack.
4. Prepare player prefabs with **NetworkCharacter** and selected module controllers.
5. Wire GC2 Visual Scripting as usual — replication runs through the networking layer.

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Managers, bridges, session profiles, module replication |
| [**Arawn Agnostic Demos**](gc2-arawn-agnostic-demos/overview.md) | Demo scenes and sample setups |
| [**Code**](code/overview.md) | Public API, custom transport adapters |
| [**Visual Scripting**](visual-scripting/triggers.md) | Network-related triggers, instructions, conditions |

---

## Documentation status

**Scaffold only.** Contributors with a licensed Arawn install should document from their local Unity project following [CONTRIBUTING.md](../CONTRIBUTING.md) — no proprietary source in this repo.

---

## Official GC2 modules

For base Game Creator 2 documentation (required foundation):

- [GC2 Core](../README.md)
- [Collection index](../docs/README.md)
