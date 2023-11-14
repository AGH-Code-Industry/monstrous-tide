___

>This document will describe the process of receiving damage in game. So far it is rather a suggestion of the calculation system.

[[__Statistics outline__|Stats]] related to damage mechanisms are:
- weapon's damage;
- wielder's luck;
- attacked character's armour and health.
# Base formula

This is ***suggested*** general formula for calculating incoming damage:
$$DMG_{incoming} = (DMG_{weapon})^{1-\frac{ARM}{5 \times DMG_{weapon}}}$$
where $DMG_{weapon}$ is weapon's raw damage, and $ARM$ is character's armour.

**Important to note:** this formula imposes one condition: $DMG_{weapon} > 1$.

>[!info]- Why this formula?
>I assumed that incoming damage:
>- should be equal to raw damage, if armour is equal to 0;
>- should decrease as the armour stat is increasing for a set weapon's damage;
>- should never be totally zeroed only by armour[^1].
>
>Above statements lead me to this formula suggestion.
# Critical hits

*Luck* stat specifies a possibility of a critical hits. If an attack happens to critically hit, the following formula[^2] is applied to damage calculated above:

$$DMG_{critical} = DMG_{incoming} \times \left(1+ \frac{LuckSum}{100\%} \right)$$
where *LuckSum* is sum of wielder's and weapon's *Luck* stats.

**Important to note:** *Luck* is already a percentage value.

# Damage bonuses

Some mechanics, stage bonuses or other game attributes may provide damage bonus for a single weapon, chosen weapon set or for all character's weapons. Regardless of the bonus source, this should be applied in following way:
##### If damage bonus is a percentage value:
$$DMG_{total} = DMG_{output} \times \frac{DMGBonus}{100\%}$$
##### If damage bonus is a flat value[^3]\:

$$DMG_{weapon} := DMG_{weapon} + DMGBonus$$
This $DMG_{weapon}$ value will be then put into basic [[Damage calculations#Formula|damage formula]].
# Health decrease

Health decreased as a result of receiving damage will be equal to $DMG_{incoming}$ or $DMG_{critical}$ in critical hit situation. For more, see [[Health fluctuations]] file.

[^1]: Do we consider absolutely blocking attacks, something like "attack evasion" mechanics?
[^2]: Requires further discussion - do we add some kind of "Critical Damage" stat, or do we calculate critical hits some other way?
[^3]: These will only regard weapons raw damage, as stated in the *Outline* file.