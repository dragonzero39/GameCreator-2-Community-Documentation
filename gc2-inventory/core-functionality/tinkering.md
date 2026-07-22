---
description: >-
  Tinkering — craft and dismantle via Item recipes, input/output Bags, and
  Tinker UI.
icon: hammer
---

# Tinkering

**Tinkering** turns items into other items:

- **Crafting** — many ingredients → one result
- **Dismantling** — one item → ingredient reclaim (often chance-based)

Recipes live on the **Item** (**Crafting** section). Stations open with **Open Tinker UI** and a **Tinker Skin**.

Official: [Tinkering](https://docs.gamecreator.io/inventory/tinkering/) · [Crafting (Items)](https://docs.gamecreator.io/inventory/items/crafting/) · [Tinker UI](https://docs.gamecreator.io/inventory/ui/tinker-ui/)

---

## Core concepts

| Term | Role |
| ---- | ---- |
| **Tinker Skin / Tinker UI** | Prefab that shows craft and/or dismantle |
| **Input Bag** | Ingredients / item to dismantle |
| **Output Bag** | Crafted item or reclaimed ingredients (often same as input) |
| **Filter Item** | Show only Items that inherit from this type |
| **Ingredients** | Shared list on the craftable Item |

There is **no Recipe ScriptableObject** — configure craft/dismantle on each Item.

---

## Craft vs dismantle

| | **Craft** | **Dismantle** |
| --- | --- | --- |
| Enable on Item | **Craft** | **Dismantle** |
| Needs | Conditions + ingredients + output space | Item in input + conditions |
| Result | New Runtime Item of the recipe Item | Remove item; try reclaim each ingredient |
| UI | Crafting Item / Ingredient UI | Dismantling Item / Ingredient UI (+ recover chance) |

Empty craft conditions = always pass (ingredients still required). Failed output add rolls back ingredient removal.

---

## Stations and filters

Forge vs alchemy is the same system with different **Filter Item** parents (e.g. Equipment vs Potion) and different skins.

| Field on **Open Tinker UI** | Role |
| --------------------------- | ---- |
| **Tinker Skin** | Which UI prefab to open |
| **Input Bag** / **Output Bag** | Source and destination Bags |
| **Filter Item** | Limit listed recipes by inheritance |

---

## In-bag combine

Item **Can Combine** enables drag-combining two cells when the craft recipe has **exactly two** ingredients. That path is separate from Tinker UI.

---

## Visual scripting

| Type | Title |
| ---- | ----- |
| Instruction | **Open Tinker UI**, **Close Tinker UI** |
| Condition | **Can Craft**, **Can Dismantle**, **Is Craftable**, **Is Dismantable**, **Enough Ingredients**, **Is Tinker UI Open** |
| Event | **On Craft**, **On Dismantle**, **On Open Tinker UI**, **On Close Tinker UI** |

Bag / Merchant / Tinker UIs are mutually exclusive.

---

## Gotchas

1. Configure recipes on Items, not a separate Recipe asset.
2. Dismantle reclaim can be probabilistic per ingredient unit.
3. Input and output Bags may differ (station output crate).
4. Use **Filter Item** to split stations without duplicate systems.

---

## Related

- [Items](items.md) · [Bags](bags.md) · [User Interface](user-interface.md)
- [Instructions](../visual-scripting/instructions.md)
