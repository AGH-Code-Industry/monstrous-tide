---
tags: items
type: weapons, description
description: "A description of weapon *Lantern of Randolph Carter* and everything related to it."
upgrade: base
---
*Formerly known as Menacing Lantern.*
___

>This document will outline the most important aspects of weapon in the title - its properties, progression scheme, statistics, principles of working and many more. It is a sketch, as it needs specified information provided by programmers.

# Before reading

>[!tip]- Important notes
>This weapon follows: introduced [[Damage calculations|damage calculations formulae]], introduced [[Health fluctuations|health changing schemes]], introduced current [[General statistics outline|stat system]] (which *may be* up to change) and other **important** things introduced in this documentation. Please, be wary of them.

# General

*Lantern of Randolph Carter* is one of the weapons player may consider good that is also an "early-game" one.

Randolph Carter is a main character in  story "The Dream-Quest of Unknown Kadath" where he spends quite some time underground beside ghouls. So I thought that the name of the lantern should come with the character who spent a lot of time in total darkness.

### Weapon's tags:

For rules and definitions, see [[Weapon tags and types|this file (tba)]].

```tba```
# Combat info

### Initial form:

The *Lantern* is considered an AOE weapon - it periodically deals AOE damage to surrounding opponents:
- time tick: 0.5 s;
- AOE radius: medium[^1];
- it attacks *every single opponent* in area specified by AOE radius;

[^1]: It depends on what *medium* means in Godot. 

# Weapon's progression

### Suggested progress line:

*Values in range, f.e. 1-10%, mean it is a single, randomly chosen value between 1 and 10%.*

Available upgrades for the *Lantern of Randolph Carter* :
### 4-tier:

- ***Basic:*** +1-10% *DMG*; +1-15% *ATKSpeed*; +2-8% *HPSteal*; +2-10% *AOE*; +5-15% *MovSpeed*; +2-8% *Dodge*; +5-15% *Pickup*;
- ***Advanced:*** +10-25% *Dodge*; +15-50% *AOE*; +5-15% *CritChance*; +15-45% *CritDMG*; +35-65% *DMG*;  +10-20% *HPSteal*; +35-65% *ATKSpeed*;
- ***Legendary***: 
	- *Stat-related*: +50-85% *DMG*, +30-65% *HPSteal*; +50-100% *AOE*; +15-30% *CritChance*; +50-85% *CritDMG*; 
	- *Mechanics*: 
		- "Whenever an enemy is hit by an attack from this weapon, they are thrown away from the player for a distance of 50% of the weapon's _AOE_ stat. Occurs every 1 second.";
		- "If this weapon scores a critical hit, player gains: +10% _Pickup_, +10% _HPRegen_ and +10% _MovSpeed_ for 10 seconds. May only occur every 10 seconds."; 
		- "Whenever an enemy is defeated with this weapon, player obtains incoming damage immunity for 10 seconds, +50% _HPSteal_ and +50% _Multi_. May only occur every 60 seconds."
		- "This weapon has 45% chance to heal the player by 5% of their _MaxHP_ every 5 seconds.";
- ***Mythic:*** *follows rules mentioned [[Rarity and drop-rate systems#Mythic|here]]!*
	- **[[Sands of Buried]]**
	- **Blinding Guide** *(tba)*
	- **[[Iä, Iä, Cthulhu fhtagn!]]**
	- additional stats are taken from the same pool as the previous ones.


# *[[Journal]]* entry

*A lantern found in the oldest of dungeons - the only source of light that could help me out of this never-ending maze they locked me inside... Once I picked it up, it immediately began enlightening everything with vibrancy: the stones, the walls and also my thoughts. With this still and yet alive ancestral creation, I have never felt more in-power and confident...*

