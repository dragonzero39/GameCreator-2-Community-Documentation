---
description: >-
  Currency assets, coin denominations, Bag wealth, and conversion patterns.
icon: coins
---

# Currencies

A **Currency** asset defines how wealth is measured. Bags store an integer **Wealth** balance per Currency. Item **Price** always references one Currency.

Create: **Create → Game Creator → Inventory → Currency**

Official: [Currencies](https://docs.gamecreator.io/inventory/currencies/)

---

## Core concepts

| Term | Role |
| ---- | ---- |
| **Currency** | Asset with a unique ID and one or more **Coins** |
| **Coin** | Named denomination — integer **value**, icon, tint |
| **Wealth** | Bag’s integer balance for that Currency (in smallest units) |
| **Price** | Item trade value in a single Currency |

Most games use one Currency with a single Coin (e.g. **Gold**, value `1`).

---

## Coins and conversion

Coins are display denominations of one integer pool — not separate wallets.

| Example coin | Value (units) |
| ------------ | ------------- |
| Copper | `1` |
| Silver | `25` |
| Gold | `125` (5 × Silver) |

To grant “1 Gold”, **Change Currency** / **Add Wealth** by **125**, not by “1 gold coin.”

{% hint style="warning" %}
Wealth has **no decimals**. For two decimal places, store amounts ×100 and format in UI.
{% endhint %}

---

## Wealth on Bags

| Where | How |
| ----- | --- |
| Editor defaults | Bag **Stock** → **Add Wealth** (Currency + amount) — applied on Awake |
| Runtime | **Change Currency**, merchant trades, **Move Wealth to Bag** |
| Display | **Bag Wealth UI** + **Coin UI** prefabs — see [User Interface](user-interface.md) |

---

## Multi-currency patterns

| Pattern | Use when |
| ------- | -------- |
| One Currency, many Coins | Classic copper/silver/gold display |
| Multiple Currency assets | Separate economies (Gold vs Gems) |
| Item Price | Always one Currency per Item |

---

## Visual scripting

| Type | Title | Role |
| ---- | ----- | ---- |
| Instruction | **Change Currency** | Modify wealth on a Bag |
| Instruction | **Move Wealth to Bag** | Move all currencies between Bags |
| Condition | **Compare Wealth** | Threshold checks |
| Event | **On Change Currency** | React to wealth changes |

---

## Gotchas

1. Ops use **unit values**, not “number of gold coins.”
2. Item prices cannot mix Currencies.
3. Wealth rules are separate from Bag **weight** / overload.

---

## Related

- [Bags](bags.md) · [Items](items.md) · [Merchants](merchants.md) · [User Interface](user-interface.md)
