---
tags: items
type: weapons, description
description: "*The Holy Hand Grenade* is a... grenade that, with it, Thou mayest blow Thine enemies to tiny bits."
upgrade: base
---

>[!quote] Original demo text:
>Święty granat? Holy hand granade i nawiązanie do monty pythona XD? No co tu dużo mówić, leci kuleczka i wybucha później

>This document will outline the most important aspects of weapon in the title - its properties, progression scheme, statistics, principles of working and many more. It is a sketch, as it needs specified information provided by programmers.

# Before reading

>[!tip]- Important notes
>This weapon follows: introduced [[Damage calculations|damage calculations formulae]], introduced [[Health fluctuations|health changing schemes]], introduced current [[General statistics outline|stat system]] (which *may be* up to change) and other **important** things introduced in this documentation. Please, be wary of them.

# General

*The Holy Hand Grenade* is indeed a blessing of a God: it is thrown and it explodes rapidly!

***Graphic tip:*** It's inspired by [this thing](https://www.youtube.com/watch?v=xOrgLj9lOwk) and I would love it stays this way.

### Weapon's tags:

For rules and definitions, see [[Weapon tags and types|this file (tba)]].

```tba```

# Combat info

### Initial form:

This is a pretty straightforward *AOE*-type weapon:
- every time tick it is being thrown in a random direction around the player:
	- time tick: 0.3 sec
	- it is thrown into a random point in an *AOE* area around the player;
	- when it reaches its destination, it explodes and deals ~~holy~~ damage to enemies in the same *AOE* area;
- this weapon also gives the player certain bonuses if it hits specified number of enemies:
	- if any enemies are hit, the angels sing and the player gains +100% *ARM* for 3 seconds;
	- if it hits ***exactly three (no more, no less)*** enemies, the player also gains +35% *CritChance*, +50% *CritDMG* and +50% *DMG* bonuses for 3 seconds (**this effect may only be triggered every 6 seconds**)

# Weapon's progression

### Suggested progress line:

*Values in range, f.e. 1-10%, mean it is a single, randomly chosen value between 1 and 10%.*

Available upgrades for *The Holy Hand Grenade* :

- ***Basic:*** +5-10% *HPSteal*; +2-8% *AOE*; +5-15% *Pickup*; +5-8% *CritChance*; +2-8% *CritDMG*; +8-15% *DMG*;
- ***Advanced:*** +10-25% *AOE*; +8-15% *CritChance*; +10-35% *CritDMG*; +25-55% *DMG*;  +7-15% *HPSteal*; +2-10% *Dodge*; +2-8% *ATKSpeed*;
- ***Legendary***: 
	- *Stat-related*: +60-95% *DMG*, +30-65% *HPSteal*; +40-70% *AOE*; +15-30% *CritChance*; +30-65% *CritDMG*; +15-25% *ATKSpeed*; 
	- *Mechanics*: 
		- "If it hits ***exactly five*** enemies, it also hits three other, random enemies in the *AOE* radius with -50% *DMG* (**this effect may only be triggered every 5 seconds**)";
		- "Whenever this weapon scores a *CritHit*, the player gains +69% *MovSpeed*, +100% *AOE* and +420% *DMG* for 1 second (**this effect may only be triggered every 2 seconds**)";
		- "Whenever this weapon hits a *Zombie-, Vampire-type* enemy, the player gains +15% *HPSteal* and +20% *DMG*";

- ***Mythic:*** *follows rules mentioned [[Rarity and drop-rate systems#Mythic|here]]!*
	- **Hellish Python's Egg** *(tba)*
	- **Brother Maynard's Little Secret** *(tba)*
	- **The Holy Pin** *(tba)*
	- additional stats are taken from the same pool as the previous ones.


# *[[Journal]]* entry

*Once I found this weird, spherical object in a little chest. There was also a book in which there was highlighted... a manual? Or anything it was trying to be: "First shalt thou take out the Holy Pin. Then, shalt thou count to three. No more. No less. Three shalt be the number thou shalt count, and the number of the counting shalt be three..." and so on.*

*So I took it with me to protect it against any idiots. I do not really know - what one must have in their mind to make the author of this note emphasise so much: the number must be three. What else - five?*



___
Pytanie czy chcemy iść w tego typu bronie, moim zdaniem fajne, ale ==**do przedyskutowania na spotkaniu.**==

Proszę proszę nazwijmy to tak xd