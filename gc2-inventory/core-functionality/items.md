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
| **Parent Item** | Another Item this one inherits from — type matching, props/sockets, shared logic |
| **ID** | Unique string in the Catalogue — regenerate after duplicating |
| **Prefab** | World mesh for drop/instantiate; empty = cannot drop into the scene |

---

## Inspector sections

| Section | What you set |
| ------- | ------------ |
| **Head** | **ID**, **Parent Item**, **Prefab**, drop rules |
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

## Parent Item

The **Parent** field on an Item points at another Item asset. That parent is a **type template** in an inheritance chain — not a full copy of every field.

```text
Weapon          ← abstract parent (often never given to the player)
  └─ Sword
       ├─ Iron Sword
       └─ Steel Sword
```

A child **is a type of** its parent (and grandparents). A parent is **not** a type of its child.

| Check | Iron Sword vs Sword | Sword vs Iron Sword |
| ----- | ------------------- | ------------------- |
| Child vs parent | Matches | — |
| Parent vs child | — | Does **not** match |

Use **Is Type of Item** (and anything that calls the same inheritance test) against the **parent** when you mean “any sword,” and against the **leaf** when you mean that exact Item.

### What Parent is for

| Use | How |
| --- | --- |
| **Equipment slots** | Slot **Base Item** = `Head` / `Weapon` — every child equips in that slot |
| **Sockets** | Socket Base Item = `Rune` — any Item that inherits from Rune can attach |
| **Bag UI tabs** | **Filter by Parent** shows only Items under that type |
| **Tinker stations** | **Filter Item** on **Open Tinker UI** (forge vs alchemy) |
| **Merchant niche** | **Sell Niche Type** filters by inheritance |
| **Has Item / counts** | Query the parent ID to count all children in a Bag |
| **Shared logic** | **Execute From Parent** on Info / Equip / Usage |

### What inherits (and what does not)

| Inherits when enabled | Stays per-Item (set on each asset) |
| --------------------- | ---------------------------------- |
| **Properties** (**Inherit From Parent**) — override values with the left toggle | **Info** (name, sprite, color) |
| **Sockets** (**Inherit From Parent**) | **Shape** (size, weight, stack) |
| **Execute From Parent** runs parent **On Create** / **Can Equip** / **On Equip** / **Can Use** / **On Use** first | **Price**, craft recipe, prefab, drop rules |

{% hint style="success" %}
Define shared property IDs (e.g. `defense`) on the parent once. Children inherit the property and only override the number — Wooden Shield vs Steel Shield.
{% endhint %}

**Execute From Parent** example: put drink animation + SFX on a `Potion` parent; Health / Mana potions enable the toggle and only add their heal/mana instructions.

### Practical tips

1. Build a shallow hierarchy: category → subtype → concrete Item.
2. Parents can be “abstract” (no prefab, never added to Bags) and still work for type checks and filters.
3. Keep leaf Items thin — unique name, sprite, price, and overrides only.
4. Deep chains work (child → parent → grandparent), but prefer two or three levels for clarity.

Official inheritance notes: [Items](https://docs.gamecreator.io/inventory/items/) · [Properties](https://docs.gamecreator.io/inventory/items/properties/) · [Equipment](https://docs.gamecreator.io/inventory/bags/equipment/)

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
5. Prefer parent templates for type filters and shared logic; keep leaf items thin.

---

## Related

- [Bags](bags.md) · [Currencies](currencies.md) · [Tinkering](tinkering.md) · [Merchants](merchants.md)
- [Instructions](../visual-scripting/instructions.md) · [Conditions](../visual-scripting/conditions.md)
