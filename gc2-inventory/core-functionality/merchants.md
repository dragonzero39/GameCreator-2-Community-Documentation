---
description: >-
  Merchant component — stock, buy/sell rates, infinite flags, and trade UI.
icon: store
---

# Merchants

A **Merchant** lets a **client Bag** (usually the player) trade with a **merchant Bag** under rate and stock rules. Stock lives on the Merchant’s **Bag**; trade rules live on the **Merchant** component.

Official: [Merchants](https://docs.gamecreator.io/inventory/merchants/) · [Merchant UI](https://docs.gamecreator.io/inventory/ui/merchant-ui/)

---

## Core concepts

| Term | Role |
| ---- | ---- |
| **Merchant** | Trade rules + Merchant Skin |
| **Merchant Bag** | Stock and (unless infinite) wealth |
| **Client Bag** | Passed into **Open Merchant UI** — usually the player |
| **Buy Rate / Sell Rate** | Price multipliers (results floored to int) |
| **Merchant UI** | Trade window — not a plain Bag UI |

Requires **Merchant** + **Bag** on the shop object (Bag can be Self or a referenced object).

---

## Inspector

| Field | Role |
| ----- | ---- |
| **Merchant Info** | Name and description |
| **Infinite Currency** | Merchant always pays when buying from the client |
| **Infinite Stock** | Purchases clone the Item type instead of moving the instance |
| **Allow Buy Back** | Items the client sells enter merchant stock |
| **Sell Niche Type** | When enabled, filters Item types the merchant will **buy from the client** |
| **Buy Rate** | Multiplier when the **player buys** (merchant sells). Default `1` |
| **Sell Rate** | Multiplier when the **player sells** (merchant buys). Default `0.5` |
| **Bag** | Stock source |
| **Skin UI** | **Merchant Skin** |

{% hint style="info" %}
Rates above match package behavior (player buy → **Buy Rate**; player sell → **Sell Rate**). Always verify in Play Mode if you customize rates.
{% endhint %}

---

## Buy and sell rules

| Action | Checks |
| ------ | ------ |
| **Player buys** | Item allows buy; in merchant stock; client can pay; client has space |
| **Player sells** | Item allows sell; in client Bag; **not equipped**; merchant can pay (unless infinite currency); merchant can store (or buy-back path) |

- Item **Price** flags **Can Buy From Merchant** / **Can Sell To Merchant** still apply.
- Equipped items cannot be sold.
- Without **Allow Buy Back**, sold items are not recoverable from merchant stock.

---

## Merchant UI vs Bag UI

| UI | Purpose |
| -- | ------- |
| **Merchant UI** | Client Bag + merchant Bag with buy/sell hooks |
| **Bag UI** | Inventory only — no trade rates |

Only one of Bag / Merchant / Tinker UI can be open at a time. See [User Interface](user-interface.md).

---

## Visual scripting

| Type | Title |
| ---- | ----- |
| Instruction | **Open Merchant UI**, **Close Merchant UI** |
| Condition | **Can Buy**, **Can Sell**, **Is Merchant UI Open** |
| Event | **On Buy**, **On Sell**, **On Open Merchant UI**, **On Close Merchant UI** |

**Open Merchant UI** needs the **Merchant** and the **Client Bag**.

---

## Setup pattern

1. Bag on NPC/shop — **Stock** / **Wealth** for fixed inventory.
2. **Merchant** — rates, infinite flags, niche filter, Merchant Skin.
3. Interact → **Open Merchant UI** (Merchant + player Bag).

For random shop stock, fill the merchant Bag with a **Loot Table** or **Add Item** instead of only editor Stock.

---

## Related

- [Bags](bags.md) · [Currencies](currencies.md) · [Items](items.md) · [User Interface](user-interface.md)
