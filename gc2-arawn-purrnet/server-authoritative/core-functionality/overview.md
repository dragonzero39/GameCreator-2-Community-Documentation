---
description: Dedicated-server PurrNet setup, bridges, and cloud deploy concepts.
---

# Core Functionality — Server Authoritative

{% hint style="warning" %}
Third-party Arawn / PurrNet — document from your licensed local install only. Cloud details should cite public host docs (for example Edgegap), not private keys or absolute paths.
{% endhint %}

## Planned topics

- Dedicated / headless server scene prerequisites vs client scenes
- **PurrNetTransportBridge** roles when the host is not a player
- Module PurrNet bridges under dedicated authority
- Server bootstrap (ports, environment, readiness)
- Packet flow: client input → server authority → state broadcast
- Ownership mapping without a listen-server player-host
- Session profiles tuned for dedicated tick rates
- Cloud deploy concepts: container image, application version, deployment lifecycle — detailed beginner walkthrough in [Server Authoritative Setup (PurrNet + Unity)](../edgegap/server-authoritative-setup.md)
- Matchmaking / server browser handoff — full production queue design in [Edgegap Matchmaking](../edgegap/matchmaking.md)
- Observability: logs, connection quality, stop/restart behavior

Shared transport pieces (bridge families, motion anchors) may overlap with [Peer to Peer Core Functionality](../../peer-to-peer/core-functionality/overview.md); document **differences** here rather than duplicating entire catalogs.

See the [Server Authoritative overview](../overview.md), [Edgegap](../edgegap/overview.md), and the [space homepage](../../README.md).
