---
description: >-
  Bags — List vs Grid, capacity and weight, stock, wealth, equipment, loot, Skin
  UI, and saving.
icon: bag-shopping
---

# Bags

A **Bag** stores **Items** and **Currencies** on any GameObject — player, chest, merchant, corpse, or stash. It also owns optional **Equipment**, per-bag **Cooldowns**, default **Stock**, and a **Skin UI**.

Official: [Bags](https://docs.gamecreator.io/inventory/bags/) · [Equipment](https://docs.gamecreator.io/inventory/bags/equipment/) · [Loot Tables](https://docs.gamecreator.io/inventory/bags/loot-tables/)

{% hint style="info" %}
Prefer **List** Bags. Use **Grid** only when you need multi-cell item footprints.
{% endhint %}

---

## Core concepts

| Term | Role |
| ---- | ---- |
| **List / Grid** | Sequential cells vs 2D multi-cell packing |
| **Shape** | Width / height capacity + optional max weight |
| **Content** | Cells and stacks of Runtime Items |
| **Wealth** | Currency balances on this Bag — see [Currencies](currencies.md) |
| **Equipment** | Optional Equipment asset for equip slots |
| **Stock** | Editor defaults applied once on Awake |
| **Skin UI** | Bag Skin opened with **Open Bag UI** — see [User Interface](user-interface.md) |
| **Wearer** | Who wears gear / drop origin (default **Self**) |
| **Overloaded** | Weight exceeded — does **not** block adds |

---

## Inspector

| Section | Purpose |
| ------- | ------- |
| **Bag type** | **List** or **Grid** |
| **Maximum Height / Width** | Hard capacity (List height optional; Grid always finite) |
| **Maximum Weight** | Soft limit → **Overloaded** when exceeded |
| **Equipment** | Equipment asset + per-slot bone overrides |
| **Stock** | **Add Stock** / **Add Wealth** |
| **Skin UI** | List or Grid Bag Skin (must match type) |
| **Wearer** | Character for props and world drops |

---

## List vs Grid

| | **List** | **Grid** |
| --- | --- | --- |
| Layout | Vertical cells | Width × height matrix |
| Cell | One stack root | Item **Width × Height** footprint |
| Capacity | Optional max **height** (cells); width = 1 | Always finite (common default 8 × 6) |
| Resize | **Increment Bag Height** | Height and **Width** |
| UI | **Bag List UI** | **Bag Grid UI** |

Grid can fail **Can Add** even with empty cells if the footprint does not fit.

---

## Capacity

| Constraint | Blocks adding? |
| ---------- | -------------- |
| Max height / grid footprint | **Yes** |
| Max weight | **No** — use **Is Overloaded** for penalties |

List max height = max **cells** (stacks), not total units inside stacks. Adds prefer stacking before claiming a new cell. Runtime size can only **increase**.

---

## Stock, wealth, and loot

| Approach | Use for |
| -------- | ------- |
| **Add Stock** / **Add Wealth** | Fixed starter or merchant inventory |
| **Loot Table** | Random chest / corpse fills |

Create loot: **Create → Game Creator → Inventory → Loot Table**. Use the **Loot Table** instruction into a Bag (run multiple times to fill). Prefer Loot Tables over Stock for random loot.

Wealth details: [Currencies](currencies.md). Merchant stock: [Merchants](merchants.md).

---

## Equipment

1. Create **Equipment** (**Create → Game Creator → Inventory → Equipment**).
2. **Add Equipment Slot** — **Base Item** + bone **Handle**.
3. Assign the asset on the Bag; override bones per instance if needed.

Items must be in this Bag, **Is Equippable**, and inherit from the slot Base Item. Set **Wearer** if the Bag is not on the Character.

---

## Skin UI and transfers

- Skin type must match List/Grid.
- Only one of Bag / Merchant / Tinker UI open at a time.
- Drag-drop stays **inside one Bag**. Cross-bag: **Send To Bag**, **Move Content to Bag**, or dual UI + **Set Bag UI**.

Full UI authoring: [User Interface](user-interface.md).

---

## Saving

**Remember → Inventory/Bag** can store **Shape**, **Items**, **Wealth**, **Equipment**, **Cooldowns**. Restore is deferred one frame so Awake Stock runs first, then saved data replaces it. Shape restore only grows size.

---

## Common setups

| Role | Pattern |
| ---- | ------- |
| **Player** | List Bag + Equipment + inventory Skin + Remember |
| **Chest** | Separate Bag + transfer Skin; Interact → **Open Bag UI** |
| **Merchant** | Merchant’s Bag for stock — trade via [Merchants](merchants.md) |
| **Upgradeable bag** | Raise height/width with Increment instructions |

---

## Visual scripting

| Kind | Titles |
| ---- | ------ |
| Instructions | **Add / Remove / Drop Item** (+ Runtime), **Move Content / Wealth to Bag**, **Increment Bag Height / Width** |
| UI | **Open / Close Bag UI**, **Set Bag UI**, Drop/Transfer/Split Amount, **Deselect Item UI** |
| Conditions | **Can Add**, **Enough Space**, **Has Item**, **Is Overloaded**, **Is Bag UI Open** |
| Events | **On Add**, **On Remove**, **On Open / Close Bag UI**, **On Change Currency** |

---

## Gotchas

1. Overloaded ≠ full.
2. Wearer **Self** is wrong if Bag is not on the Character.
3. Skin mismatch fails open.
4. Stock is Awake-only; Remember overrides afterward.
5. Cannot shrink Bag size at runtime.

---

## Related

- [Setup](setup.md) · [Items](items.md) · [Currencies](currencies.md) · [Merchants](merchants.md) · [User Interface](user-interface.md)
- [Instructions](../visual-scripting/instructions.md) · [Conditions](../visual-scripting/conditions.md) · [Triggers](../visual-scripting/triggers.md)
