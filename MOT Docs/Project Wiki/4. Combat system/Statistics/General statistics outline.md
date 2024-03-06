---
tags: combat
type: stats
description: "An outline of every stat occuring among all characters, weapons and enemies in our game (so far)."
---

___

>This document is a first outline of statistics system, what they are, what is their job and everything more needed at the moment.

***Important to note:*** There is no rule that *every* weapon should have *every* stat - it is acceptable that weapons have different stats.

# Statistics overview

| **Type** | **Name** | **Abbreviation** | **Brief description** | **Related** |
| :---: | :---: | :---: | :---: | :---: |
| Weapon-related | Damage | *DMG* | Specifies amount of raw damage on weapon's output | - [[Damage calculations]] | 
| ^^ | Attack speed/cooldown | *ATKSpeed/CD* | Specifies how much time shall last until next usage of the weapon | *none yet* |
| ^^ | Attack radius/range/size/AOE | *ATKRad/AOE* | Specifies area which weapon shall cover with damage | *none yet* |\
| | | | *it is set to 0 if the weapon is single target* | |
| ^^ | Critical hit chance | *CritChance/CC* | Specifies possibility of an attack delivering a critical hit | - [[Damage calculations]] |
| ^^ | Critical hit damage | *CritDMG/CD* | Specifies additional damage amount delivered by a critical hit | ^^ |
| ^^ | Multishot | *Multi/MULTI* | Specifies possibility of attacking another time in a time period *(requires clarification)* | *none yet* |
| ^^ | Duration | *Dur/DUR* | Specifies amount of time for which player is allowed to use the weapon | *none yet* | 
| ^^ | Lifesteal/Healthsteal | *HPSteal* | Specifies a chance to additionally regenerate HP to the player after damaging an enemy | - [[Health fluctuations]] |
| Character-related | Health | *HP* | Is a value that specifies character's life force - if it reaches 0, the character is considered dead | ^^ |
| ^^ | Health regeneration | *HPRegen* | Specifies amount of Health regenerated by character in time | ^^ |
| ^^ | Armour | *ARM* | Specifies incoming damage reduction | - [[Damage calculations]] |
| ^^ | Movement speed | *MovSpeed* | Specifies how fast the character moves | *none yet* |
| ^^ | Pick-up radius | *Pickup* | Specifies a circular area round the character, where it may pick up items from the ground | *none yet* |
| ^^ | Dodge | *Dodge* | Specifies possibility (a chance) of evading an incoming attack (i.e. zeroing the incoming damage of that attack) | - [[Dodging system]] |
| Universal | Luck | *Luck* | Specifies additional *(?)* possibility of rare items/upgrades drop-rate (0%-100%) | *none yet* |

All above statistics may be changed (especially increased) via upgrading system, in-game progression and buff/debuff systems while playing.

Specific correlations are described in separate documents in *Statistics* directory.