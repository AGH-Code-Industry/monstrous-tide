---
tags: items
type: weapons, description
description: "*Ferocious Tentacle* is an octopus-limb-inspired weapon which shoots lighter enemies away."
upgrade: base
---

>This document will outline the most important aspects of weapon in the title - its properties, progression scheme, statistics, principles of working and many more. It is a sketch, as it needs specified information provided by programmers.

# Before reading

>[!tip]- Important notes
>This weapon follows: introduced [[Damage calculations|damage calculations formulae]], introduced [[Health fluctuations|health changing schemes]], introduced current [[General statistics outline|stat system]] (which *may be* up to change) and other **important** things introduced in this documentation. Please, be wary of them.

# General

*Ferocious Tentacle* is one of the weapons player plyer gets when in "fishy" biomes - early game, easy mechanics

### Draft

**_Ferocious Tentacle_** - this will be a basic weapon, dropping from _fish-like_ [enemies](app://obsidian.md/Enemies%20concept%20list) and described as follows:
    - looks like a disgusting tentacle, dark-coloured, rotting?
    - does single target damage and throws away enemies in a little distance, where specific direction is random;
    - does mid damage, but good for a start-game item;
    - *my idea is this weapon (lore-wise) is a cut-off part of some [[Enemies concept list#"Fish-based" - name to be covered by lore|fish]] enemies, while its legendary upgrade (preferably Blue Fin) is a limb of some fish boss.*

### Weapon's tags:

For rules and definitions, see [[Weapon tags and types|this file (tba)]].

```tba```

# Combat info

### Initial form:

Single target weapon:
- time tick: 0.2 s;
- its *Multishot* is defined as double-attack: 
	- if it happens, there shall occur *two Tentacles* and deal damage to two separate enemies;
- it throws away an enemy **every third hit**:
	- distance the enemy flies is set by AOE stat;
	- direction is random;

# Weapon's progression

### Suggested progress line:

*Values in range, f.e. 1-10%, mean it is a single, randomly chosen value between 1 and 10%.*

Available upgrades for the *Ferocious Tentacle* :

- ***Basic:*** +8-20% *DMG*; +2-8% *HPSteal*; +2-8% *AOE*; +2-8% *Dodge*; +5-15% *Pickup*; +5-10% *CritDMG*; 
- ***Advanced:*** +15-30% *Dodge*; +15-25% *AOE*; +8-20% *CritChance*; +25-60% *CritDMG*; +35-65% *DMG*;  +15-25% *HPSteal*; +15-35% *Dodge*
- ***Legendary***: 
	- *Stat-related*: +50-85% *DMG*; +30-60% *AOE*; +15-30% *CritChance*; +50-85% *CritDMG*; +20-40% *Dodge*; 
	- *Mechanics*: 
		- "If this weapon crits, it throws away the hit enemy while not violating its default 3 second rule. This effect only occurs every 1 second."
		- "-25% *ATKSpeed*, +25% *Dodge*, +20% *DMG*"
		- "If an enemy was hit 3 or more times with this weapon, the next time the are hit they are instantly defeated."
		- "Whenever the player Dodges, they recover 15% of their own *HP* - occurs every 10 seconds."
- ***Mythic:*** *follows rules mentioned [[Rarity and drop-rate systems#Mythic|here]]!*
	- **Blue Fin** *(tba)*
	- **Whales Graveyard's Survivor** *(tba)*
	- additional stats are taken from the same pool as the previous ones.


# *[[Journal]]* entry

*One never forgets the stench, if they once come into contact with this free-thinking limb. Why does it move? Well, there are sure many hypotheses... But should I really care? This is a very affordable flesh-shield and it haven't once upset me. Yet.*

Why Cthulhu's? Because many ilustrations (and original descriptions) mention this god as a giant octopus.