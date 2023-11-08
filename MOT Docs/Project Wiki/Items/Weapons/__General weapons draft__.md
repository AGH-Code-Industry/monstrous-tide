___

>This document outlines how weapons shall be implemented, what they will contain, how they should progress and everything else needed at the start.
# Weapon characteristic

Weapon is a special item made for [[Damage calculations|dealing damage]] to opponents. It holds specified [[__Statistics outline__|statistics]], which can be further levelled up and rolled into new or different bonuses.

Weapons are distinguished by their: *Types*, *Tags*, *Sets*, *Statistics* and *Rarities*. They have their own levelling tree, each consisting of separate paths in which player may roll upgrades for the weapon - which is *randomized*.
# Character's weapons

As described[^1] in [[__Character outline__|character draft]] file, a playable character (which is only type considered in this paragraph) has an *Inventory*, which is an array of items they can use. A character may have unlimited amount of weapons[^2] in their inventory, but *only 5* to use at the same time[^3].

# First weapons examples

### Melee-like weapons:

1. ***Ferocious Tentacle***[^4] - this will be a basic weapon, dropping from *fish-like* [[Enemies concept list|enemies]] and described as follows:
	- looks like a disgusting tentacle, dark-coloured, rotting?
	- does single target damage and throws away enemies in a little distance, where specific direction is random;
	- does low damage, start-game item;
	- *some lore related description will drop soon*.

### Projectile-based:

1. ***Forgotten Diary***[^4] - this will be a pretty basic weapon, one of the first the player should find, provides basic functionality, as follows:
	- an ordinary looking book, may be slightly glowing white?
	- it shoots a projectile every tick dealing damage to one target enemy;
	- damage pretty low;
	- the most basic item, that can be found everywhere;
	- *some lore related description will drop soon*.
2. ***Stick of Fallen Wanderer***[^4] - also a basic weapon, one of the first player should encounter in the game:
	- a stick looking ordinary at first, but with some weird inscriptions on it which slightly glow;
	- shoots a projectile every tick, dealing AOE damage over a small radius;
	- damage pretty low;
	- may be found once, at the beginning of the game;
	- *some lore related description will drop soon*.
### Tornado-based:

1. ***The Orb of The Undead***[^4] - this will be a pretty basic weapon, described as follows:
	- a glowing orb, that circles around current player's position;
	- every few seconds it *ticks* and deals damage in a specified AOE (i.e. it *does not* deal damage constantly while circling);
	- it will be one of the first weapons player may pick up from dead enemies, low damage;
	- may be cave exclusive?
	- *some lore related description will drop soon*.
2. ***Heart of the Soil***[^4] - this will also be a pretty basic weapon, but working in a different way, as follows:
	- slightly glowing, maybe rock-shaped, dirty and covered with soil little entity;
	- found in forests or areas rich in plants, also biome exclusive?;
	- it also circles around the player's current position, but deals damage *constantly* to enemies it bumps into (like it crushes through them);
	- deals low damage;
	- *some lore related description will drop soon*.

[^1]: As *it will be* described, actually. Due to further upgrades, of course.
[^2]: Do we limit the inventory?
[^3]: An issue to discuss.
[^4]: Or some other ~~cool~~ name.