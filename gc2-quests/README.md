---
description: >-
  Game Creator 2 Quests — quest and task management, journal, tracking, POIs,
  and navigation UI.
icon: map
---

# Game Creator 2 Quests

The **Quests** module automates mission management: **quests** with **tasks**, progress tracking, points of interest, a **journal**, and UI tools including minimap indicators and a navigation compass for active objectives.

Official reference: [Quests documentation](https://docs.gamecreator.io/quests/)

**Requires:** Game Creator 2 Core

---

## What Quests is capable of

### Quests and tasks

**Quest** assets define mission structure with tasks that can be activated, completed, failed, or abandoned. Task values support counters and custom progress.

### Tracking and POIs

Track/untrack quests; expose world **points of interest** for UI markers and compass navigation.

### Journal and UI

Built-in UI patterns for quest logs, minimap blips, and on-screen objective direction.

### Groups and conditions

Test quest groups (all/any completed) and branch Triggers on quest/task state.

---

## How Quests is typically used

1. Create **Quest** assets with tasks and completion rules.
2. Activate quests from **Dialogue** choices or world Triggers.
3. Update **Task Value** or complete tasks via Instructions when gameplay conditions are met.
4. Use Conditions (`Is Quest Active`, `Is Task Completed`) to gate areas and conversations.
5. Let UI systems show tracked quest destinations automatically.

---

## Visual Scripting overview

| Page | Examples |
|------|----------|
| **Triggers** | On Quest Activate/Complete/Fail, On Task Value Change, On Track/Untrack |
| **Instructions** | Quest Activate, Task Complete, Set Task Value, Quest Track |
| **Conditions** | Is Quest Active/Completed, Is Task Active, group completion checks |

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Quests, tasks, tracking, POIs, journal |
| [**GC2 Quests Demos**](gc2-quests-demos/overview.md) | Example quest setups |
| [**Code**](code/overview.md) | Quest API extension |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority** — Events, Instructions, Conditions |

{% hint style="warning" %}
Drafted from [official documentation](https://docs.gamecreator.io/quests/). Verify demo packages locally if installed.
{% endhint %}
