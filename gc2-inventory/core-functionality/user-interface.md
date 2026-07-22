---
description: >-
  Inventory skins — Bag, Merchant, and Tinker UI components and authoring
  basics.
icon: window-maximize
---

# User Interface

Inventory UI is prefab-driven. Assign a **Skin** on a Bag or Merchant, or pass a **Tinker Skin** into **Open Tinker UI**. Start from the module’s UI examples when possible.

Official: [User Interface](https://docs.gamecreator.io/inventory/ui/) · [Bag UI](https://docs.gamecreator.io/inventory/ui/bag-ui/) · [Merchant UI](https://docs.gamecreator.io/inventory/ui/merchant-ui/) · [Tinker UI](https://docs.gamecreator.io/inventory/ui/tinker-ui/)

---

## Skins

| Skin | Create path | Root component |
| ---- | ----------- | -------------- |
| **Bag Skin** | Create → Game Creator → Developer → Inventory → Bag Skin | **Bag List UI** or **Bag Grid UI** |
| **Merchant Skin** | … → Merchant Skin | **Merchant UI** |
| **Tinker Skin** | … → Tinker Skin | **Tinker UI** |

{% hint style="warning" %}
Bag Skin type must match the Bag (**List** vs **Grid**). Only one of Bag / Merchant / Tinker UI may be open at a time.
{% endhint %}

---

## Key components

Add under **Game Creator → UI → Inventory → …**

| Component | Role |
| --------- | ---- |
| **Bag List UI** / **Bag Grid UI** | Root inventory UI for a Bag |
| **Bag Cell UI** | One cell; needs a **Graphic** for pointer events |
| **Bag Equip UI** | Equipment / hotbar slot |
| **Bag Wealth UI** / **Bag Weight UI** | Wealth and weight readouts |
| **Merchant UI** | Trade layout (merchant + client Bags) |
| **Tinker UI** | Craft / dismantle layout |
| **Selected Cell UI**, **Socket UI**, **Property UI** | Detail panels for the selection |
| **Coin UI**, **Price UI** | Denomination / price display |
| Crafting / Dismantling Item & Ingredient UI | Tinker recipe rows |

**Coin UI** depends on **Price UI** / wealth hierarchy — wire example skins first, then customize.

---

## Bag UI essentials

| Field | Role |
| ----- | ---- |
| **Prefab Cell** | Template with **Bag Cell UI** |
| **Content** | Parent where cells spawn |
| **Filter by Parent** | Optional Item-type filter (tabs) |
| **Can Drop Outside** / **Max Drop Distance** | World drop rules |
| **Drop Amount** | One vs whole stack |

Cell: **Can Drag**, **On Drop**, **On Select**; optional **Merchant Info** (only useful under Merchant UI).

Equip UI: target **Bag** + equipment slot; **Base UI** / **Equipped UI** bindings.

World drop requires an Item **Prefab**. Cross-bag moves use **Send To Bag**, move Instructions, or dual UI — not same-Bag drag. See [Bags](bags.md).

---

## Merchant and Tinker UI

| UI | Opens via | Needs |
| -- | --------- | ----- |
| **Merchant UI** | **Open Merchant UI** | Merchant Skin on Merchant; client Bag |
| **Tinker UI** | **Open Tinker UI** | Tinker Skin; input/output Bags; optional Filter Item |

Details: [Merchants](merchants.md) · [Tinkering](tinkering.md).

---

## Authoring a custom skin

1. Duplicate an example skin or build a Canvas prefab.
2. Add the correct root (**Bag List/Grid UI**, **Merchant UI**, or **Tinker UI**).
3. Wire Content + cell/recipe prefabs (cells need a **Graphic**).
4. Create the Skin asset pointing at the prefab.
5. Assign on Bag/Merchant, or pass the Tinker Skin to **Open Tinker UI**.

---

## Visual scripting (UI)

| Title | Role |
| ----- | ---- |
| **Open / Close Bag UI** | Inventory window |
| **Open / Close Merchant UI** | Trade window |
| **Open / Close Tinker UI** | Craft / dismantle window |
| **Set Bag UI** | Retarget a Bag UI to another Bag |
| **Set Drop / Transfer / Split Amount** | One vs Stack / Half modes |
| **Deselect Item UI** | Clear selection |
| **Is Bag / Merchant / Tinker UI Open** | Conditions |
| **On Open / Close … UI** | Events |

---

## Related

- [Setup](setup.md) · [Bags](bags.md) · [Merchants](merchants.md) · [Tinkering](tinkering.md) · [Currencies](currencies.md)
