---
description: >-
  Dedicated-server PurrNet multiplayer for GC2 — server-authoritative topology
  and cloud hosting path.
---

# Server Authoritative — Overview

**Server Authoritative** means a **dedicated game server** process owns simulation authority. Clients connect as pure clients. This mode targets production online play, anti-cheat posture, and cloud orchestration (for example [Edgegap](https://docs.edgegap.com/)).

{% hint style="info" %}
The Arawn layer already models server-authoritative **input and state flow**. This section documents the **dedicated-server topology** (and hosting) on top of PurrNet — distinct from [Peer to Peer](../peer-to-peer/overview.md) listen-server hosting.
{% endhint %}

## When to use this mode

- You need a **headless / dedicated** Linux (or other) server build
- Players must not host the authoritative simulation
- You plan **matchmaking**, fleets, or regional deploy (Edgegap, custom orchestrator, etc.)
- You want clearer scale and disconnect handling than player-hosted sessions

For local host/join prototyping first, start with [Peer to Peer](../peer-to-peer/overview.md), then migrate patterns here.

## Typical flow

1. Build a **dedicated server** player (headless) and a separate **game client**.
2. Wire PurrNet + Arawn managers for server role vs client role.
3. Containerize the server (Docker) when targeting cloud hosts.
4. Deploy and obtain connection endpoints (dashboard, matchmaker, or API).
5. Connect clients; tune **NetworkSessionProfile** and observability.

Exact wizard/menu steps and GC2 Visual Scripting entries will be documented under this mode’s Core Functionality and Visual Scripting pages as they are verified locally.

## Documentation in this mode

| Page | Contents |
|------|----------|
| [Core Functionality](core-functionality/overview.md) | Dedicated setup, bridges, deploy, ownership on dedicated host |
| [Demos](demos/overview.md) | Dedicated / cloud sample setups |
| [Code](code/overview.md) | Server build, bootstrapping, orchestration hooks |
| [Triggers](visual-scripting/triggers.md) | Dedicated/server-lifecycle Trigger events |
| [Instructions](visual-scripting/instructions.md) | Connect, deploy, matchmaking-related Instructions |
| [Conditions](visual-scripting/conditions.md) | Server role, ready-state, and authority Conditions |

## Related external docs

- [Edgegap — Getting Started](https://docs.edgegap.com/)
- [Edgegap — Unity Getting Started](https://docs.edgegap.com/unity)
