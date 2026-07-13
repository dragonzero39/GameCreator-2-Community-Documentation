---
description: >-
  Server-authoritative setup for PurrNet and Unity on Edgegap — account, Linux
  dedicated build, Docker, App Versions, and first cloud deploy.
---

# Server Authoritative Setup (PurrNet + Unity)

This page walks you from **zero cloud servers** to a **working dedicated server on Edgegap** that a Game Creator 2 / Arawn / **PurrNet** client can join.

You do **not** need to be a cloud engineer. You do need:

- A Windows (or Mac) PC that can run Unity and Docker Desktop
- Patience for the first upload (large files take time)
- Your Arawn + PurrNet project already able to run a **dedicated/server role** build locally (or follow peer-to-peer docs first, then convert to dedicated)

{% hint style="success" %}
Official source of truth for button labels and plugin menus: [Unity — Getting Started](https://docs.edgegap.com/unity) and [Developer Tools](https://docs.edgegap.com/unity/developer-tools). Edgegap updates plugins over time — if a menu name differs slightly, trust the live Edgegap docs.
{% endhint %}

---

## Big picture (six stages)

{% stepper %}
{% step %}
**Prepare your computer** — Edgegap account, Unity Linux modules, Docker, Edgegap Unity tools.
{% endstep %}
{% step %}
**Build a Linux dedicated server** — Unity produces a headless server folder.
{% endstep %}
{% step %}
**Containerize** — wrap that folder in a Docker image so it runs the same on every machine.
{% endstep %}
{% step %}
**Test locally** — run the container on your PC and join with the Unity Editor client.
{% endstep %}
{% step %}
**Upload to Edgegap** — create an **Application** + **App Version** and store the image.
{% endstep %}
{% step %}
**Deploy to cloud** — start a Deployment, copy host + external port, connect the client, then stop when done.
{% endstep %}
{% endstepper %}

When those six work, move to [Edgegap Matchmaking](matchmaking.md) so players never paste IP addresses by hand.

---

## Stage 0 — Concepts you need before clicking anything

### Dedicated server vs game client

| Build | What it is | Who uses it |
|-------|------------|-------------|
| **Client** | The game players install (graphics, UI, input) | Players / Editor play mode |
| **Dedicated server** | Same project, **Linux** target, no player screen — runs rules and authority | Cloud (Edgegap) or your PC for testing |

Server-authoritative design: the **server** decides outcomes; clients send input and show results.

### Why Linux?

Edgegap (and most game hosts) run servers on **Linux**. Unity can build Linux dedicated servers from Windows if you install the right **Unity Hub modules**. You do not need a Linux desktop.

### What is Docker?

Think of Docker as a **shipping container for software**:

- Your server build goes inside
- The base Linux pieces go inside
- When Edgegap starts a Deployment, it starts **that exact box**

Docker ≠ Docker Hub. Docker is the engine; Docker Hub is an optional public store. Edgegap provides its own **Container Registry** for your images.

### Apps and versions

| Edgegap object | Analogy |
|----------------|---------|
| **Application** | The game title’s server product (“My GC2 Game Server”) |
| **App Version** | One release of that product (`2026.07.13-16.00.00-UTC`) with CPU/RAM and **port mapping** |
| **Deployment** | One live instance of a version (players connect here) |

Many versions can exist (dev, staging, live). Matchmaking later points a **profile** at one App Version.

### Ports (the part that confuses everyone)

| Port type | What it means |
|-----------|----------------|
| **Internal port** | The port your **netcode transport listens on inside** the container (often `7777` UDP — follow your PurrNet transport settings) |
| **External port** | The public port Edgegap chooses for that Deployment (often **random** on purpose) |

Clients must connect to **Host URL + External port**, not the internal port alone.

{% hint style="warning" %}
Edgegap recommends server netcode listen on address `0.0.0.0` and a known internal port (commonly `7777`). Whatever you choose, the App Version **port mapping** must match that internal port and protocol (UDP/TCP).
{% endhint %}

---

## Stage 1 — Prepare your computer

### 1. Create an Edgegap account

1. Register at Edgegap (free tier; no credit card required for testing — see their current Free Tier limits).
2. Confirm your email if asked.
3. Sign in to the **Dashboard** — you will use it for Apps, Deployments, logs, and Matchmaker later.

### 2. Install Unity Linux build modules

In **Unity Hub**:

1. Open **Installs**.
2. Gear / settings on the Unity version your project uses → **Add Modules**.
3. Enable at least:
   - **Linux Build Support (IL2CPP)** and/or **Linux Build Support (Mono)** (match how you build)
   - **Linux Dedicated Server Build Support**

Install modules for **every** Unity editor version you will build servers with.

### 3. Install Docker Desktop

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) (no account required for basic use).
2. **Restart** the computer after install.
3. Open Docker Desktop and wait until it shows **running**.

{% hint style="info" %}
If Docker commands fail later, check Docker Desktop → Settings → Advanced for CLI tools installed at **System** level (Edgegap documents this when `docker: command not found` appears).
{% endhint %}

### 4. Install Edgegap’s Unity tools

Edgegap provides two free Unity packages (install via Package Manager + git URL — you need a **Git client** such as [git-scm](https://git-scm.com/) installed):

| Tool | Role |
|------|------|
| **Dedicated Servers Quickstart Plugin** | Build Linux server, containerize, upload, deploy from the Editor ([plugin docs](https://docs.edgegap.com/unity/developer-tools)) |
| **Edgegap Unity SDK** | Optional helpers for Deployments, Matchmaking, Server Browser (`https://github.com/edgegap/edgegap-unity-sdk.git`) |

Follow Edgegap’s current install steps in [Developer Tools](https://docs.edgegap.com/unity/developer-tools). Prefer **git URL** installs over random ZIP copies (missing dependencies are a common failure).

### 5. Connect the plugin to your Edgegap account

In Unity, complete the plugin **sign-in / connect account** step. Fix any console errors before building.

---

## Stage 2 — Build the game server (Linux dedicated)

{% stepper %}
{% step %}
Open your project’s **Build Settings** / dedicated server flow used by the Edgegap plugin. Include every scene the **server** needs (manager scene, gameplay scene, etc.).
{% endstep %}
{% step %}
Confirm the server scene starts your networking in **server** mode (Arawn managers + PurrNet transport listening). Client-only UI objects should not block headless startup.
{% endstep %}
{% step %}
Optional: from Edgegap’s Server Hosting menu, add their **port verification / environment bootstrap** helper to the initial server scene (helps catch port mismatches after cloud deploy).
{% endstep %}
{% step %}
Set transport listen address to `0.0.0.0` and note your **game port** (example: `7777` UDP). Write it down — App Version mapping must match.
{% endstep %}
{% step %}
Use the plugin **Build server** action. Wait until the console is clean. Edgegap’s default output is typically under a folder such as `Builds/EdgegapServer/ServerBuild` inside the project.
{% endstep %}
{% endstepper %}

<details>
<summary>Common build blockers</summary>

- **OpenXR** — can block Linux dedicated targets; disable OpenXR for server builds (client can keep it).
- Scenes missing from Build Settings — players join but scene IDs fail.
- Client-only packages crashing headless — strip or gate them for server defines.

</details>

---

## Stage 3 — Containerize the server

{% stepper %}
{% step %}
In the Edgegap plugin, open containerize settings. Keep the build path **inside** the project (Docker needs relative paths).
{% endstep %}
{% step %}
Choose an **image name** (for example `my-gc2-game-server`) and an **image tag** (timestamps work well: `2026.07.13-16.23.00-UTC`). Tags must not contain spaces.
{% endstep %}
{% step %}
Leave the default Dockerfile path unless you already know you need a custom recipe.
{% endstep %}
{% step %}
Click **Containerize with Docker**. When finished, confirm the image exists in Docker Desktop → **Images**.
{% endstep %}
{% endstepper %}

{% hint style="info" %}
Huge images (multiple GB) slow every deploy. Prefer server-only assets, compression, and excluding client-only content — see Edgegap’s optimize guidance on the Unity getting-started page.
{% endhint %}

---

## Stage 4 — Test the container on your PC (do this before uploading)

Uploading a broken image wastes time. Local test is free.

{% stepper %}
{% step %}
**Deploy local container** from the plugin (or equivalent). Confirm Docker Desktop → Containers shows the server **Up** (not restarting).
{% endstep %}
{% step %}
Note the **published external port** Docker mapped for your game protocol.
{% endstep %}
{% step %}
In the Unity **client** (Editor is fine), set connection target to `localhost` (or `127.0.0.1`) and that **mapped** port — not a guessed port.
{% endstep %}
{% step %}
Play: confirm characters spawn, Arawn replication works, and nothing spams fatal errors in server logs (`docker logs` or Docker Desktop log view).
{% endstep %}
{% step %}
Stop/delete the local container when done so it does not keep using CPU/RAM.
{% endstep %}
{% endstepper %}

<details>
<summary>Cannot connect locally?</summary>

1. Container status must be **Up** — if **Exited**, read logs for a crash.
2. Published Docker port must match what the **client** uses.
3. Server transport **internal** port must match what you published (`-p 7777/udp` style mapping).
4. On Apple Silicon Macs, ensure linux/amd64 platform flags if Edgegap’s docs require them for your setup.

</details>

---

## Stage 5 — Upload to Edgegap (App + Version)

{% stepper %}
{% step %}
In the plugin, set **Application name** and **Application version** (version often matches your image tag).
{% endstep %}
{% step %}
Select the local image name + tag from the previous stage.
{% endstep %}
{% step %}
Run **Upload image and create App version**. Wait for completion without console errors.
{% endstep %}
{% step %}
In the Edgegap **Dashboard**, finish App Version settings. Define a **Port**:
   - Name it clearly (for example `game`)
   - **Internal** = your transport listen port
   - **Protocol** = UDP or TCP matching PurrNet transport
{% endstep %}
{% step %}
Confirm CPU/memory fit your Free Tier or paid tier. Raise resources later by duplicating an App Version if the server hits **OOM** or sits at 100% CPU after warmup.
{% endstep %}
{% endstepper %}

<details>
<summary>Upload / quota issues</summary>

- Registry storage full — delete unused images/versions or shrink the image.
- Free tier Application or Version limits — remove unused entries or upgrade.
- New version missing in plugin lists — finish the dashboard create form completely.

</details>

---

## Stage 6 — Deploy to cloud and connect a client

{% stepper %}
{% step %}
From the plugin or Dashboard, **Deploy** the App Version. Wait until status is **Ready** (not Error).
{% endstep %}
{% step %}
Open Deployment details. Copy:
   - **Host URL / FQDN**
   - **External port** for your `game` port mapping
{% endstep %}
{% step %}
In the **client**, set PurrNet/Arawn connection fields to that host + **external** port (not the internal port).
{% endstep %}
{% step %}
Expect a short wait after Ready while Unity initializes. Clients should **retry** connect for a limited time (for example every 1s) before giving up and returning to menu.
{% endstep %}
{% step %}
Verify gameplay. Check Dashboard logs if something fails.
{% endstep %}
{% step %}
**Stop** the Deployment when finished testing so capacity/cost free up.
{% endstep %}
{% endstepper %}

{% hint style="warning" %}
Disable VPN while testing latency-sensitive placement. Also turn off netcode “simulated lag” if you are judging real ping.
{% endhint %}

### Manual deploy is only a learning step

Starting Deployments by hand is how you prove the pipeline. A live game should **automate** starts via [Edgegap Matchmaking](matchmaking.md) (or Server Browser / custom backend). Players should never type FQDNs.

---

## After your first successful cloud connect

Checklist before Matchmaking:

- [ ] Linux server build boots headless without player input
- [ ] Local Docker join works
- [ ] Cloud Deployment Ready → client joins with FQDN + external port
- [ ] Port mapping matches transport protocol
- [ ] You know how to **Stop** deployments
- [ ] You plan how the **server stops itself** when a match ends (cost control)
- [ ] Logs: Dashboard logs vanish when a deployment stops — plan Endpoint Storage / external logs for live ops

### Injected environment variables (preview)

Every Deployment can read environment variables Edgegap injects (deployment id, ports mapping, location, and — once Matchmaking is used — ticket/match data). Unity servers typically call `Environment.GetEnvironmentVariable(...)`. Edgegap’s Unity SDK `DeploymentAgent` samples show typed helpers.

You will use these heavily in [Edgegap Matchmaking](matchmaking.md) so the server knows who was matched and with which attributes.

### Separate client and server projects/builds

| Recommendation | Why |
|----------------|-----|
| Keep a dedicated **server** build pipeline | Avoid shipping server-only code paths incorrectly; faster server images |
| Version client and server together | Mismatched netcode versions cause cryptic disconnects |
| Use different Edgegap App Versions for **dev** vs **live** | Safe experiments without breaking players |

---

## GC2 / Arawn / PurrNet notes for this stage

Document exact menu names from your licensed install as you verify them. The hosting contract is:

1. Server build starts **Arawn networking managers** and **PurrNet** in server/listen role inside the container.
2. Client build uses the **same protocol/port expectations**, but as a client connecting to Edgegap’s FQDN + external port.
3. Do not commit proprietary plugin source into this GitBook repo — describe steps and UI names only.

Related local docs: [Server Authoritative Core Functionality](../core-functionality/overview.md), [Server Authoritative Code](../code/overview.md).

---

## Troubleshooting quick map

| Symptom | Check first |
|---------|-------------|
| Deploy Ready but cannot connect for minutes | Server still initializing — retry client connect; optimize server startup |
| Timeout / connection failed | External port vs internal; protocol UDP/TCP; deployment logs for exceptions |
| Deployment restarts / `OOM kill` | Increase App Version memory or reduce server scene memory use |
| 100% CPU forever after Ready | Heavy init or missing “start server on headless” style setting for your netcode |
| Free Tier stopped after ~60 minutes | Expected limit — upgrade or shorten tests |
| Deployment always dies after 24h | Edgegap sanitization — use Persistent / Private Fleets patterns for long-lived servers |

Community help: Edgegap Discord (linked from their docs).

---

## Next step

When cloud join works end-to-end, implement a full queue → match → deploy → connect → end-match loop in [Edgegap Matchmaking](matchmaking.md).

Official deep links: [Unity Getting Started](https://docs.edgegap.com/unity) · [Deployments](https://docs.edgegap.com/learn/orchestration/deployments)
