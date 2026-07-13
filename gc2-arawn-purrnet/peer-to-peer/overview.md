---
description: >-
  Player-hosted PurrNet multiplayer for GC2 — host/join listen-server topology.
---

# Peer to Peer — Overview

**Peer to Peer** in this space means **player-hosted** multiplayer: one client also runs the host (listen server), and other players join that session. It is the default path for local testing, LAN play, and small online groups without a separate dedicated server process.

{% hint style="info" %}
Gameplay authority still flows through the Arawn networking layer (input/state replication). “Peer to Peer” here names the **topology** (who hosts), not “everyone is equally authoritative.”
{% endhint %}

## When to use this mode

- You want **Host / Join** UI and a single Unity build for both host and clients
- You are prototyping multiplayer with two Editor instances or ParrelSync
- Session size is small and a player machine can host
- You are not yet ready for Dockerized dedicated servers or cloud orchestration

For dedicated processes and cloud hosting, use [Server Authoritative](../server-authoritative/overview.md).

## Typical flow

1. Install agnostic networking layer + PurrNet + desired GC2 modules.
2. Open **PurrNet Scene Setup Wizard** and walk through Project → Modules → Transport → Core → Scene → Review.
3. Assign a player prefab; enable module bridges matching your game.
4. Host/join via wizard-generated UI (**PurrNetDemoCanvasUI**, **PurrNetHostJoinUI**) or your own menu.
5. Tune **NetworkSessionProfile** for tick rate and interpolation.

## Documentation in this mode

| Page | Contents |
|------|----------|
| [Core Functionality](core-functionality/overview.md) | Wizard, bridges, packet flow, ownership, channels, host/join UI |
| [Demos](demos/overview.md) | Demo scenes and local multiplayer test setups |
| [Code](code/overview.md) | Bridge extension and manual scene setup |
| [Triggers](visual-scripting/triggers.md) | Mode-related Trigger events |
| [Instructions](visual-scripting/instructions.md) | Mode-related Instructions |
| [Conditions](visual-scripting/conditions.md) | Mode-related Conditions |
