---
tags: items
type: weapons, description
description: "*Sands of Buried* is a legendary upgrade to *Menacing Lantern* weapon."
upgrade: legendary
---
___
>[!attention] This weapon is a legendary upgrade of [[Menacing Lantern]].

>[!quote] Original demo text:
>Legendarny upgrade do latarni: Nasza broń zamienia się w klepsydrę i spowalnia wrogów, którzy zbliżą się do gracza. Myślę, że może być to dosyć przydatne, ponieważ gracz raczej chce unikać wrogów i trzymać dystans. A zaimplementowanie tego może być dosyć proste bo można zrobić taka funkcje liniową co im bliżej gracza znajduje się przeciwnik tym wolniej się porusza.
___

>This document will outline the most important aspects of weapon in the title - its properties, progression scheme, statistics, principles of working and many more. It is a sketch, as it needs specified information provided by programmers.

# Before reading

>[!tip]- Important notes
>This weapon follows: introduced [[Damage calculations|damage calculations formulae]], introduced [[Health fluctuations|health changing schemes]], introduced current [[General statistics outline|stat system]] (which *may be* up to change) and other **important** things introduced in this documentation. Please, be wary of them.

# General

This weapon should give our player ticks of satisfaction, as it magnificently slows down most of bad guys around them while also dealing some decent damage.

### Weapon's tags:

For rules and definitions, see [[Weapon tags and types|this file (non-existing yet, tba)]].

```tba```

# Combat info

This weapon will **upgrade no further** - it is a final form of *Menacing Lantern*.

## Stats

They shall be all inherited from the previous form of the *Lantern*. 

## Principles

- this weapon still deals AOE damage of medium (*or slightly increased*) radius:
	- *all its damage is boosted by 25%* and *boosted by 60% against [[Enemies concept list#Vampires|Vampires]]*;
	- time tick changed from 0.5 s to 0.3 s;
	- half of the enemies hit are slowed down by 70% for 2 seconds:
		- no cooldown, this occurs every single hit;
		- this does not stack, it just refreshes its duration (i.e. you hit a golem once and they are slowed down for next 2 seconds - if another attack slows them down again, they stay slowed down, but their time tick refreshes to 2 seconds);
- different cool artwork and animations;

# *[[Journal]]* entry

*Everything I see is effervescent to me - there exist no obstacles nor any inconveniences. Those, who once ruled with the steadiest of hands, shall worry us no further, for their time has come to an end. And if they even try, it is me to wield the oracle, the Sands to tell the chants!*

*Even Sur Am themselves will never again dare to look up to the ceiling, begging for the tiniest of moments - his Dagger is not no match anymore...*