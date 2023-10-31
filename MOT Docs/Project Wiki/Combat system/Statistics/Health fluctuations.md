___

>This will regard health [[__Statistics outline__|stat]] changing mechanics, such as health regeneration, health steal, receiving damage and any other. At this moment, these are rather suggestions.


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

*Healthsteal* is a mechanic providing a weapon with an ability to regenerate additional health points for its wielder, alongside their own [[Health fluctuations#Health regeneration|health regeneration]] mechanic[^2]. It is calculated in a way described below:
$$HP_{stealed} = DMG_{dealt} \times \frac{HPSteal}{100\%}$$
**Important to note:** $HPSteal$ stat is already a percentage value.

[^1]: Do we consider it a separate stat, or set *one-for-all* health regeneration cooldown?
[^2]: I assume it should be fully *independent* of character's personal health regeneration.