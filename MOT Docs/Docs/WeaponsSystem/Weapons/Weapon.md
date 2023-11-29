---
extends: Node2D
---

This is base class all weapons will inherit from
## methods:

Return Value Type|Name and arguments|Description
-|-|-
`void`|add_stats(incoming_stats: Array\[[[Stat]]\])|Adds stats to current stat_set
Array\[[[WeaponUpgrade]]\]|get_available_upgrades()|Used to get all the upgrades that can be applied to this weapon with regard to their tier (eg, if you have one tier 4 upgrade you won't be able to get another tier 4 upgrade)
`void`|_ready() | All possible_upgrades and upgrades parameters are read from constants file and set here

## fields:

Name|type|Description
-|-|-
`stat_set`|`stat_set`|Represents all stats of current weapon
`possible_upgrades`|`Array[UpgradeTier]`|This field specifies all upgrades that can be applied to this weapon
`upgrades`|`Array[UpgradeTier]`|Represents upgrades that have been applied to this weapon
