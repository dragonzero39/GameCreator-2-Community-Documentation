---
description: >-
  Install Game Creator 2 Inventory, Preferences catalogue, Create menus, and
  first-time project setup.
icon: wrench
---

# Setup

**Game Creator 2 Core** Inventory comes with items, bags, wealth, merchants, tinkering, and inventory UI. It will not run without Core.

Official hub: [Inventory](https://docs.gamecreator.io/inventory/)

***

## Requirements

| Need                    | Notes                                                                |
| ----------------------- | -------------------------------------------------------------------- |
| **Game Creator 2 Core** | Required                                                             |
| **Inventory module**    | Under `Assets/Plugins/GameCreator/Packages/Inventory/` after install |
| **Unity UI**            | Skins use uGUI components shipped with the module                    |

Install Inventory the same way you install other GC2 modules (Asset Store or your usual import flow). Layout on disk can differ per project — do not hard-code absolute paths in docs or shared assets.

***

## Preferences

**Edit → Preferences → Game Creator → Inventory** (or the Game Creator Preferences window → **Inventory**).

| Setting       | Role                                           |
| ------------- | ---------------------------------------------- |
| **Catalogue** | Project-wide list of **Item** assets           |
| **Refresh**   | Rescan the project and rebuild the item ID map |

{% hint style="info" %}
After adding or duplicating many Items, run **Refresh** so the Catalogue stays in sync.
{% endhint %}

***

## Create menus

| Asset             | Path                                                          |
| ----------------- | ------------------------------------------------------------- |
| **Item**          | Create → Game Creator → Inventory → Item                      |
| **Currency**      | Create → Game Creator → Inventory → Currency                  |
| **Equipment**     | Create → Game Creator → Inventory → Equipment                 |
| **Loot Table**    | Create → Game Creator → Inventory → Loot Table                |
| **Bag Skin**      | Create → Game Creator → Developer → Inventory → Bag Skin      |
| **Merchant Skin** | Create → Game Creator → Developer → Inventory → Merchant Skin |
| **Tinker Skin**   | Create → Game Creator → Developer → Inventory → Tinker Skin   |

There is **no separate Recipe asset**. Craft and dismantle data live on each Item’s **Crafting** section.

***

## Scene components

| Component    | Menu                                                |
| ------------ | --------------------------------------------------- |
| **Bag**      | Add Component → Game Creator → Inventory → Bag      |
| **Merchant** | Add Component → Game Creator → Inventory → Merchant |
| **Prop**     | Add Component → Game Creator → Inventory → Prop     |

UI building blocks live under **Add Component → Game Creator → UI → Inventory → …** (Bag List/Grid UI, Merchant UI, Tinker UI, cells, wealth, and related). See [User Interface](user-interface.md).

***

## First-time checklist

1. Confirm Core and Inventory are installed.
2. Optionally import Inventory example packages (`Inventory.UI`, `Inventory.Examples`, `Inventory.Items`, `Inventory.Adventure`).
3. Create a **Currency** (often a single **Gold** coin with value `1`).
4. Create parent **Item** templates, then concrete items.
5. Add a **Bag** to the player (prefer **List**). Assign **Skin UI**, **Wearer**, optional **Equipment** / Stock.
6. Wire **Open Bag UI**, **Add Item**, and **Change Currency** as needed.
7. Preferences → Inventory → **Refresh** Catalogue.

***

## Related

* [Bags](bags.md) · [Items](items.md) · [Currencies](currencies.md) · [User Interface](user-interface.md)
* [Space homepage](../)
