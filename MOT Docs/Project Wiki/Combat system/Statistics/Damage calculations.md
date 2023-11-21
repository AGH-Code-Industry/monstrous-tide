___

>This document will describe the process of receiving damage in game. So far it is rather a suggestion of the calculation system.

[[__Statistics outline__|Stats]] related to damage mechanisms are:
- weapon's damage;
- wielder's luck;
- attacked character's armour and health.
# Base formula

This is ***suggested*** general formula for calculating incoming damage:
$$DMG_{output} = (DMG_{weapon})^{1-\frac{ARM}{5 \times DMG_{weapon}}}$$
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

*Critical hit chance* stat specifies a possibility of a critical hit occurrence. It is due to random number generation whether an attack delivers critical damage or not, but still, it is a percentage value: the higher it is, the higher the possibility of a critical hit. 

**Note:** It is random until reaching 100%, which indicates that weapon *will* critically hit.

If an attack happens to deliver critical damage, it is calculated using *Critical hit damage* stat, which is as follows:
$$DMG_{critical} = DMG_{output} \times \left(1 + \frac{CritDMG\%}{100\%} \right)$$
**Note:** *CritDMG* is already a percentage value, i.e. 200% *CritDMG* stat provides tripled DMG output.
# Damage bonuses

Some mechanics, stage bonuses or other game attributes may provide damage bonus for a single weapon, chosen weapon set or for all character's weapons. Regardless of the bonus source, this should be applied in following way:
##### If damage bonus is a percentage value:
$$DMG_{total} = DMG_{output} \times \frac{DMGBonus}{100\%}$$
##### If damage bonus is a flat value[^3]\:

$$DMG_{weapon} := DMG_{weapon} + DMGBonus$$
This $DMG_{weapon}$ value will be then put into [[Damage calculations#Formula|basic damage formula]].
# Health decrease

Health decreased as a result of receiving damage will be equal to $DMG_{incoming}$ or $DMG_{critical}$ in critical hit situation. For more, see [[Health fluctuations]] file.

[^1]: Do we consider absolutely blocking attacks, something like "attack evasion" mechanics?
[^3]: These will only regard weapons raw damage, as stated in the *Outline* file.