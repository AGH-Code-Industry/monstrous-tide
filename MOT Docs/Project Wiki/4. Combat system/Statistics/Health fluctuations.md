---
tags: combat
type: calculations
description: "A profound explanation how health points should fluctuate in our game, along with according formulae."
---

___

>This will regard health [[General statistics outline|stat]] changing mechanics, such as health regeneration, health steal, receiving damage and any other. At this moment, these are rather suggestions.


# Receiving damage

Receiving damage is equivalent to character's current health decrease. Damage calculation formulas are described in [[Damage calculations|this document]], here the calculation is simple:
$$HP_{current} = HP_{beforeDMG} - DMG_{received}$$
**Pro forma:** if character's current health drops to 0, they're considered dead. If $DMG_{received} > HP_{beforeDMG}$ , current health shall be set to 0 immediately.

# Health regeneration

Character will automatically regenerate their health in set time ticks[^1], where formula is as follows:
$$HP_{regenerated} = HP_{full} \times \frac{HP Regen}{100\%} $$
**Important to note:** $HPRegen$ stat is already a percentage value.

The $HP_{regenerated}$ value will be then added to the current health of the character.

# Healthsteal

*Healthsteal* is a mechanic providing a weapon with an ability to regenerate additional health points for its wielder, alongside their own [[Health fluctuations#Health regeneration|health regeneration]] mechanic[^2].  

However, the *Healthsteal* stat specifies *a chance* of an additional healing, while attacking enemies. It is a percentage value, which means the higher the stat, the higher possibility of additional healing income. 

If the *Healthsteal* happens to deliver additional healing, it is statically set as *+1 health point*.


[^1]: Do we consider it a separate stat, or set *one-for-all* health regeneration cooldown?
[^2]: I assume it should be fully *independent* of character's personal health regeneration.