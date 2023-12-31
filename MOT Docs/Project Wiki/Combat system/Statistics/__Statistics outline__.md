---
aliases:
  - stats
  - statistics
  - stat
  - statistic
---

___

>This document is a first outline of statistics system, what they are, what is their job and everything more needed at the moment.

*From Miro, as of 30th Oct 2023*

>[!attention]- Obsidian Community plug-in
>This document uses *Table Extended* community plug-in. Please, install it in order to properly see below contents. It's absolutely safe and will apply only to this vault. 
>
>To do so, go to *Settings*, then *Community plug-ins*, turn on the plugins, download *Table extended* plugin by AidenLX, turn it on in plugins tab and **also turn it on in *Table extended* settings** below. You may need to re-open this vault to force Obsidian to read the plug-in.

# Statistics overview

| **Type** | **Name** | **Abbreviation** | **Brief description** | **Related** |
| :---: | :---: | :---: | :---: | :---: |
| Weapon-related | Damage | *DMG* | Specifies amount of raw damage on weapon's output | - [[Damage calculations]] | 
| ^^ | Attack speed/cooldown | *ATKSpeed/CD* | Specifies how much time shall last until next usage of the weapon | *none yet* |
| ^^ | Attack radius/range/size/AOE | *ATKRad/AOE* | Specifies area which weapon shall cover with damage *(do we even consider single target?)* | *none yet* |
| ^^ | Multishot | *Multi/MULTI* | Specifies possibility of attacking another time in a time period *(requires clarification)* | *none yet* |
| ^^ | Duration | *Dur/DUR* | Specifies amount of time for which player is allowed to use the weapon | *none yet* | 
| ^^ | Lifesteal/Healthsteal | *HPSteal* | Specifies amount of HP which will be additionally regenerated for the player after damaging an enemy | - [[Health fluctuations]] |
| Character-related | Health | *HP* | Is a value that specifies character's life force - if it reaches 0, the character is considered dead | ^^ |
| ^^ | Health regeneration | *HPRegen* | Specifies amount of Health regenerated by character in time | ^^ |
| ^^ | Armour | *ARM* | Specifies incoming damage reduction | - [[Damage calculations]] |
| ^^ | Movement speed | *MovSpeed* | Specifies how fast the character moves | *none yet* |
| ^^ | Pick-up radius | *Pickup* | Specifies a circular area round the character, where it may pick up items from the ground | *none yet* |
| ^^ | Dodge | *Dodge* | Specifies possibility (a chance) of evading an incoming attack (i.e. zeroing the incoming damage of that attack) | - [[Dodging system]] |
| Universal | Luck | *Luck* | Specifies possibility of critical hit and increases rare item/upgrades drop-rate (0%-100%) | - [[Damage calculations]] |\
| | | | | - [[Dodging system]] to be discussed |

All above statistics may be changed (especially increased) via upgrading system and in-game progression.

Specific correlations are described in separate documents in *Statistics* directory.