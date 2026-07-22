---
description: >-
  Item assets vs Runtime Items — shape, price, properties, sockets, equipping,
  usage, and crafting flags.
icon: cube
---

# Items

An **Item** is a ScriptableObject template. A **Runtime Item** is a live instance in a Bag (unique state such as durability or filled sockets) — similar to Prefab vs Prefab instance.

Create: **Create → Game Creator → Inventory → Item**

Official: [Items](https://docs.gamecreator.io/inventory/items/) · [Properties](https://docs.gamecreator.io/inventory/items/properties/) · [Sockets](https://docs.gamecreator.io/inventory/items/sockets/) · [Equipping](https://docs.gamecreator.io/inventory/items/equipping/) · [Crafting](https://docs.gamecreator.io/inventory/items/crafting/)

---

## Core concepts

| Term | Role |
| ---- | ---- |
| **Item** | Project definition — name, shape, price, props, sockets, equip, use, craft |
| **Runtime Item** | Instance in a Bag; can differ from the template |
| **Parent** | Inheritance for type checks, properties, sockets, and shared logic |
| **ID** | Unique string in the Catalogue — regenerate after duplicating |
| **Prefab** | World mesh for drop/instantiate; empty = cannot drop into the scene |

---

## Inspector sections

| Section | What you set |
| ------- | ------------ |
| **Head** | **ID**, **Parent**, **Prefab**, drop rules |
| **Info** | **Name**, **Description**, **Sprite**, **Color**; optional **On Create**; **Execute From Parent** |
| **Shape** | **Width**, **Height** (Grid), **Weight**, **Max Stack** |
| **Price** | **Currency** + value; **Can Buy From Merchant** / **Can Sell To Merchant** |
| **Properties** | Named number/text/icon/color data; optional inherit + overrides |
| **Sockets** | Attachment slots (Base Item + Socket ID); optional inherit |
| **Equipment** | **Is Equippable**, equip prefab; **Can Equip** / **On Equip** / **On Unequip** |
| **Usage** | **Can Use**, **Consume on Use**, **Cooldown**; **On Use** instructions |
| **Crafting** | **Ingredients**; **Craft** / **Dismantle** flags and conditions |

---

## Shape and stacking

| Field | Role |
| ----- | ---- |
| **Width / Height** | Grid footprint (List treats each stack as one cell) |
| **Weight** | Contributes to Bag weight / overload |
| **Max Stack** | How many identical instances share one cell |

{% hint style="warning" %}
Items with **Sockets** force **Max Stack = 1**.
{% endhint %}

---

## Inheritance

- Children can inherit **Properties** and **Sockets** when inherit toggles are on.
- Type checks: a child matches itself and its parents; a parent does **not** match a child.
- **Execute From Parent** (Info / Equip / Usage) runs parent conditions/instructions first — use for shared potion SFX, equip rules, etc.

---

## Properties and sockets

| Feature | Role |
| ------- | ---- |
| **Properties** | Mutable named data on the Runtime Item (e.g. `attack`) |
| **Sockets** | Attach other items (runes, gems) by Base Item inheritance |

Socketed trade price = base Item price + sum of attached item prices.

---

## Equipping and usage

| Feature | Notes |
| ------- | ----- |
| **Is Equippable** | Requires an **Equipment** asset on the Bag with a matching Base Item slot |
| **On Equip / On Unequip** | **Self** = Bag GameObject; **Target** = **Wearer** |
| **Can Use** | Conditions before use |
| **Consume on Use** | Remove on use (potions) vs reusable (whistle) |
| **On Use** | **Self** = Bag; **Target** = Wearer |

See [Bags](bags.md) for Equipment assignment and Wearer.

---

## Crafting flags

Recipes live on the Item — not a separate asset.

| Flag | Role |
| ---- | ---- |
| **Ingredients** | Shared list for craft and dismantle reclaim |
| **Craft** | Enables crafting (+ conditions / instructions) |
| **Dismantle** | Enables dismantling |
| **Can Combine** | In-bag drag-combine when the recipe has **exactly two** ingredients |

Station UI and craft/dismantle flow: [Tinkering](tinkering.md).

---

## Gotchas

1. Duplicate Item → duplicate **ID** — use **Regenerate**.
2. No **Prefab** → cannot drop or instantiate in the world.
3. One **Currency** per Item price.
4. Equipped socket changes unequip → modify → re-equip.
5. Prefer parent templates for shared logic; keep leaf items thin.

---

## Related

- [Bags](bags.md) · [Currencies](currencies.md) · [Tinkering](tinkering.md) · [Merchants](merchants.md)
- [Instructions](../visual-scripting/instructions.md) · [Conditions](../visual-scripting/conditions.md)
