___

>This document will outline the most important aspects of weapon in the title - its properties, progression scheme, statistics, principles of working and many more. It is a sketch, as it needs specified information provided by programmers.

# Before reading

>[!tip]- Important notes
>This weapon follows: introduced [[Damage calculations|damage calculations formulae]], introduced [[Health fluctuations|health changing schemes]], introduced current [[__Statistics outline__|stat system]] (which *may be* up to change) and other **important** things introduced in this documentation. Please, be wary of them.

*Its first concept is introduced [[Weapons list|here]]*.

 ***Menacing Lantern***[^1] - one of first weapons player may consider good:
	- a levitating lantern that follows player's position;
	- periodically deals medium AOE damage to surrounding opponents;
	- also, periodically heals player by a set percentage of their max health;
	- may be picked up from fallen [[Enemies concept list|vampire mages]];
	- *some lore related description will drop soon*.
# General

*Menacing Lantern* is one of the weapons player may consider good that is also an "early-game" one.

### Weapon's tags:

For rules and definitions, see [[Weapon tags]].

*tba*
# Combat info

### Initial form:

The *Lantern* is considered an AOE weapon - it periodically deals AOE damage to surrounding opponents:
- time tick: 0.5 s;
- AOE radius: medium[^1];
- it attacks *every single opponent* in area specified by AOE radius;

# Weapon's progression

### Suggested progress line:

>[!info]- Rarity systems clarification
>I suggest *two different rarity systems*, which need to be approved or denied by the team. Those include [[4-tier rarity system sketch]] and [[6-tier rarity system sketch]]. As for now, I will drop two suggestions regarding this weapon's progression.

*Values in range, f.e. 1-10%, mean it is a single, randomly chosen value between 1 and 10%.*

Available upgrades for the *Menacing Lantern* , grouped by rarity systems and their tiers:
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
- ***Mythic:*** *follows rules mentioned [[4-tier rarity system sketch#Mythic|here]]!*
	- **Light of Purification** *(tba)*
	- **Blinding Guide** *(tba)*
	- additional stats are taken from the same pool as the previous ones.

### 6-tier:

- ***Basic:*** +2-10% *ATKSpeed*; +1-15% *Pickup*; +1-15% *MovSpeed*; +2-10% *AOE*; +1-15% *Multi*; +2-10% *DMG*;
- ***Classic:*** +0.5-9% *Dodge*; +0.2-5% *CritChance*; +2-10% *CritDMG*; +10-25% *DMG*; +8-20% *AOE*; +2-10% *HPSteal*; +8-20% *Multi*;
- ***Advanced:*** +10-20% *Dodge*; +8-15% *CritChance*; +20-55% *DMG*; +50-75% *ATKSpeed*; +25-65% *AOE*; +25-35% *CritDMG*; 
- ***Exotic:***
	- *Stat-related:*+100-150% *DMG*; +15-35% *CritChance*; +45-75% *CritDMG*; +20-45% *HPSteal*; +100-150% *AOE*;
	- *Mechanics:*
		- "Whenever an enemy is hit by an attack from this weapon, they are thrown away from the player for a distance of 50% of the weapon's _AOE_ stat. Occurs every 1 second.";
		- "If this weapon scores a critical hit, player gains: +10% _Pickup_, +10% _HPRegen_ and +10% _MovSpeed_ for 10 seconds. May only occur every 10 seconds."; 
- ***Legendary:***
	- "Whenever an enemy is defeated with this weapon, player obtains incoming damage immunity for 10 seconds, +50% _HPSteal_ and +50% _Multi_. May only occur every 60 seconds."
	- "If this weapon's AoE attack deals damage to at least 10 enemies at once, this weapon gains +25% *CritChance*, +100% *AOE*, +100% *ATKSpeed* and +20% *DMG* bonuses for 5 seconds. May only occur if the current character is above 50% their *MaxHP* and every 15 seconds."
- ***Mythic:*** *follows rules mentioned [[6-tier rarity system sketch#Mythic|here]]!*
	- **Light of Purification** *(tba)*
	- **Blinding Guide** *(tba)*
	- additional stats are taken from the same pool as the previous ones.


# Lore

*tba*