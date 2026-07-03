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

**Item** assets define stackable or unique objects with custom properties, sockets for attachments, equipping rules, and usability (consume, use in world). **Runtime items** represent live instances in a bag with state separate from the ScriptableObject definition.

### Bags and equipment

The **Bag** component stores items with configurable width/height, wealth per currency, equipment slots, and weight limits. Equipment maps items to body slots and drives visual props on Characters.

### Merchants and economy

**Merchant** components define buy/sell stock, prices, and currency acceptance. Visual scripting covers opening merchant UI, transactions, and trade conditions.

### Tinker (crafting)

**Tinker** UI supports crafting and dismantling recipes — ingredient checks, output items, and success/failure from visual scripting.

### Loot

**Loot tables** define weighted drops. Instructions instantiate items or roll tables into bags.

### User interface

Skins for **Bag UI**, **Merchant UI**, and **Tinker UI** integrate with Unity UI Toolkit / uGUI patterns shipped with the module.

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
| [**Core Functionality**](core-functionality/overview.md) | Items, bags, equipment, merchants, tinker, currencies, UI |
| [**GC2 Inventory Demos**](gc2-inventory-demos/overview.md) | Adventure, Examples, Items, UI demo packages |
| [**Code**](code/overview.md) | Bag API, custom item properties, extension patterns |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority** — Events, Instructions, Conditions |

Demo packages (local install): `Inventory.Adventure`, `Inventory.Examples`, `Inventory.Items`, `Inventory.UI`
