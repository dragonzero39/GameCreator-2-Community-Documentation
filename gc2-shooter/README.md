---
description: >-
  Game Creator 2 Shooter — ranged weapons, sights, ammo, reload, ballistics,
  wind, and jamming.
icon: crosshairs
---

# Game Creator 2 Shooter

The **Shooter** module adds ranged combat to Game Creator 2. Define **Shooter weapons** with fire modes, projectiles or hitscan, **sights** (ADS, biomechanics, leaning), **ammo** and magazines, reload sequences, wind effects, jamming, and full visual scripting integration on Characters.

Weapons extend Core's weapon template (`TWeapon`) and use **Shooter Stance** on Characters for aiming, firing, and reload state.

Official reference: [Shooter documentation](https://docs.gamecreator.io/shooter/)

**Requires:** Game Creator 2 Core

---

## What Shooter is capable of

### Weapons and fire modes

**ShooterWeapon** assets configure shooting style — semi, burst, full-auto, charge, and projectile vs. raycast behavior. Munition tracks ammo types and magazine capacity.

### Sights

**Sight** assets define aim-down-sights behavior, crosshairs, camera and IK offsets, and sight switching. Instructions change active sight and drive character lean.

### Reload and jamming

Reload sequences support tactical and quick reload, shell ejection, and jam/fix jam gameplay. Events fire on jam start and fix.

### Ballistics and environment

**Wind** affects projectile paths. Hit events provide impact data for damage and VFX hooks.

### Integration with Core

Uses Core Characters for locomotion while in shooter stance, Core Cameras for aim shots, and Core Visual Scripting for all gameplay wiring.

---

## How Shooter is typically used

1. Create **ShooterWeapon**, **Ammo**, **Reload**, and **Sight** assets.
2. Equip weapons on Characters via Instructions or the Shooter stance defaults.
3. Listen for **On Shoot Hit**, **On Equip/Unequip**, and jam events in Triggers.
4. Use Conditions for ammo state, sight ID, trigger pull, and jam checks.
5. Combine with **Stats** for damage, **Inventory** for ammo items, **Perception** for AI hearing gunshots.

---

## Visual Scripting overview

~6 events, ~19 instructions, ~6 conditions:

| Page | Examples |
|------|----------|
| **Triggers** | On Equip Weapon, On Shoot Hit, On Weapon Jam, On Wind Change |
| **Instructions** | Pull/Release Fire Trigger, Reload Weapon, Set Magazine, Fix Jam, Change Wind |
| **Conditions** | Has Equipped Shooter, Is Jammed, Is Pulling Trigger, Has Sight ID |

---

## How this space is organized

| Section | Contents |
|---------|----------|
| [**Core Functionality**](core-functionality/overview.md) | Weapons, sights, ammo, reload, wind, UI |
| [**GC2 Shooter Demos**](gc2-shooter-demos/overview.md) | Examples and Weapons demo packages |
| [**Code**](code/overview.md) | Weapon extension, custom fire modes |
| [**Visual Scripting**](visual-scripting/triggers.md) | **Priority** — Events, Instructions, Conditions |

Demo packages: `Shooter.Examples`, `Shooter.Weapons`
