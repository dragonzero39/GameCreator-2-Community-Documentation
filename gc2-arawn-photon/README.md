---
description: >-
  Arawn Photon integration for Game Creator 2 Networking Layer — Photon
  transport adapter (third-party).
icon: cloud
---

# Arawn Photon Integration

{% hint style="danger" %}
**Third-party extension.** Requires the [Arawn Agnostic Networking Layer](../gc2-arawn-agnostic-networking/README.md) and a licensed **Photon** stack. Not official Game Creator 2.
{% endhint %}

---

## What this integration is

The **Photon transport** connects the Arawn GC2 Networking Layer to **Photon** (PUN / Fusion / related stack — exact package depends on your Arawn distribution). Like PurrNet, it implements **NetworkTransportBridge** and routes GC2 input/state through Photon's client-server model.

This space documents Photon-specific setup, bridges, and workflows **separate from** the PurrNet integration so each transport can evolve independently.

---

## Relationship to other Arawn spaces

| Layer | Role |
|-------|------|
| [Arawn Agnostic Networking Layer](../gc2-arawn-agnostic-networking/README.md) | Shared managers, module controllers, session model |
| **Photon Integration** (this space) | Photon-specific transport bridge and scene wiring |
| [Arawn PurrNet Integration](../gc2-arawn-purrnet/README.md) | Alternative first-class transport |

You typically install **one** primary transport integration per project (Photon **or** PurrNet), plus the agnostic core.

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Photon bridge, scene setup, module wiring |
| [**Arawn Photon Demos**](gc2-arawn-photon-demos/overview.md) | Photon demo scenes |
| [**Code**](code/overview.md) | Photon adapter patterns |
| [**Visual Scripting**](visual-scripting/triggers.md) | Network VS entries (when applicable) |

---

## Documentation status

**Scaffold only.** Photon integration details should be documented by contributors with the asset installed locally. Do not commit proprietary source.
