---
description: >-
  Game Creator 2 Inventory — items, bags, equipment, merchants, currency,
  crafting, and loot systems.
icon: box
---

# Game Creator 2 Inventory

The **Inventory** module adds complete item management to Game Creator 2: defining items, storing them in bags, equipping gear, trading with merchants, crafting and dismantling through **Tinker**, currency/wealth, loot tables, sockets, cooldowns, and Unity UI skins.

It extends Core's Character and visual scripting — bags attach to characters, and every item operation is available as Instructions, Conditions, and Events.

Official reference: [Inventory documentation](https://docs.gamecreator.io/inventory/)

**Requires:** Game Creator 2 Core

---

## What Inventory is capable of

### Items and properties

**Item** assets define stackable or unique objects with custom properties, sockets, equipping rules, and usability. **Runtime Items** are live bag instances. See **[Items](core-functionality/items.md)**.

### Bags and equipment

The **Bag** component stores items with configurable size, wealth, equipment slots, and weight limits. See **[Bags](core-functionality/bags.md)**.

### Merchants and economy

**Merchant** components define buy/sell stock, rates, and infinite flags. See **[Merchants](core-functionality/merchants.md)** and **[Currencies](core-functionality/currencies.md)**.

### Tinker (crafting)

**Tinker** UI crafts and dismantles from Item recipes. See **[Tinkering](core-functionality/tinkering.md)**.

### Loot

**Loot tables** define weighted drops into Bags (covered under [Bags](core-functionality/bags.md)).

### User interface

Skins for **Bag**, **Merchant**, and **Tinker** UI. See **[User Interface](core-functionality/user-interface.md)**.

---

## How Inventory is typically used

1. Create **Item**, **Currency**, and **Equipment** assets in the project.
2. Add a **Bag** component to the player (and chests, enemies, merchants as needed).
3. Use Instructions to add/remove/equip items; Conditions to check inventory state; Events to react to pickups and trades.
4. Wire **Stats** or **Dialogue** modules by checking item properties or quest flags in the same Trigger graphs.
5. Import demo packages to study complete inventory UI and crafting flows.

---

## Visual Scripting overview

Inventory adds a focused visual scripting catalog (~19 events, ~37 instructions, ~28 conditions):

| Page | Categories (examples) |
|------|------------------------|
| **Triggers** | On Add, On Equip, On Buy/Sell, On Craft, Bag UI open/close |
| **Instructions** | Add Item, Equip, Loot Table, Open Merchant UI, Change Currency |
| **Conditions** | Has Item, Can Equip, Enough Space, Can Craft, Compare Wealth |

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | [Setup](core-functionality/setup.md), [Items](core-functionality/items.md), [Bags](core-functionality/bags.md), [Currencies](core-functionality/currencies.md), [Merchants](core-functionality/merchants.md), [Tinkering](core-functionality/tinkering.md), [User Interface](core-functionality/user-interface.md) |
| [**GC2 Inventory Demos**](gc2-inventory-demos/overview.md) | Adventure, Examples, Items, UI demo packages |
| [**Code**](code/overview.md) | Bag API, custom item properties, extension patterns |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority** — Events, Instructions, Conditions |

Demo packages (local install): `Inventory.Adventure`, `Inventory.Examples`, `Inventory.Items`, `Inventory.UI`
