---
tags: items
type: weapons, description
description: "*Stick of Tesla* is lightning wielding, steampunk-ish weapon."
upgrade: base
---

>[!quote] Original demo text:
>Tesla stick (robocza nazwa) - czyli steampunkowy przyrząd, który razi wrogów błyskawicą. Błyskawica może skakać z wroga na innego wroga. ~Bartek

>This document will outline the most important aspects of weapon in the title - its properties, progression scheme, statistics, principles of working and many more. It is a sketch, as it needs specified information provided by programmers.

# Before reading

>[!tip]- Important notes
>This weapon follows: introduced [[Damage calculations|damage calculations formulae]], introduced [[Health fluctuations|health changing schemes]], introduced current [[General statistics outline|stat system]] (which *may be* up to change) and other **important** things introduced in this documentation. Please, be wary of them.

# General

An unorthodox weapon with weird, unusual machinery over it, which helps the player to rapidly deal damage and outspeed their enemies.

***Graphic tip:*** Maybe somehow include Tesla's 3-6-9 in its look?

### Weapon's tags:

For rules and definitions, see [[Weapon tags and types|this file (tba)]].

```tba```

# Combat info

### Initial form:

The *Stick* is kind of considered an AOE weapon, yet not strictly:
- it shoots a **thunderbolt** into an enemy every 0.5 s:
	- each bolt (while alive) "visits" up to 10 enemies in a set, medium AOE, while also dealing them damage of equal base;
	- up to 5 thunderbolts may exists at any one time;
- if any of its thunderbolts hits a *crit*, the player has +25% *MovSpeed*:
	- it does not stack, it just refreshes its duration (ergo the player constantly has this bonus, which is not that bad to be honest);
- **important - it has low base damage**

# Weapon's progression

### Suggested progress line:

*Values in range, f.e. 1-10%, mean it is a single, randomly chosen value between 1 and 10%.*

Available upgrades for the *Stick of Tesla* :

- ***Basic:*** +1-15% *ATKSpeed*; +1-4% *HPSteal*; +5-15% *AOE*; +2-8% *Dodge*; +5-15% *Pickup*; +2-8% *CritDMG*;
- ***Advanced:*** +15-50% *AOE*; +10-25% *CritChance*; +15-45% *CritDMG*; +15-35% *DMG*;  +7-15% *HPSteal*; +25-45% *ATKSpeed*;
- ***Legendary***: 
	- *Stat-related*: +60-95% *DMG*, +30-65% *HPSteal*; +50-100% *AOE*; +15-30% *CritChance*; +35-55% *ATKSpeed*; 
	- *Mechanics*: 
		- "If a single thunderbolt manages to hit 5 criticals in a row, a *Futuristic Thunder* comes down from the sky, dealing little damage in an AOE, but also stunning 60% of hit enemies for 5 seconds."
		- "Whenever this weapon defeats an enemy, the player obtains +15% *HPSteal* for 10 seconds."
		- "Whenever the player *Dodges* any attack, maximum number of thunderbolts is increased by 1 for the next 5 seconds."
		- "This weapon has +40% *CritChance*, but -60% *CritDMG*";
- ***Mythic:*** *follows rules mentioned [[Rarity and drop-rate systems#Mythic|here]]!*
	- **Transistorised Wand** *(tba)*
	- **The Wave** *(tba)*
	- **Bulb of Oblivion** *(tba)*
	- additional stats are taken from the same pool as the previous ones.


# *[[Journal]]* entry

*After finally emerging from stinking fishy waters, it appeared - I still do not know if it was a dream or real world. Like one of Gods would step down in front of my dilated eyes and put in my hands a... thing? Is it a phantom of future or an admonishment from the past?*

*3... 6... 9? And where is the beginning?*

