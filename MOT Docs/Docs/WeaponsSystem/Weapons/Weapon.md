
This is base class all weapons will derive from
## functions/methods/etc.:

Return Value Type|Name and arguments|Description
-|-|-
`void`|apply_upgrade()|Used to apply this upgrade to a weapon. Here it's empty method to be overriden by inheriting scripts
`void`|add_stats(incoming_stats: Array[Stat])|Adds stats to current stat_set
`?`|get_available_upgrades()|Used to get all the upgrades that can be applied to this weapon with regard to thier tier (eg, if you have one tier 4 upgrade you won't be able to get another tier 4 upgrade)
## fields/variables/etc.:

Name|type|Description
-|-|-
`stat_set`|`stat_set`|Represents all stats of current weapon
`possible_upgrades`|`Array[UpgradeTier]`|This field specifies all upgrades that can be applied to this weapon
`upgrades`|`Array[UpgradeTier]`|Represents upgrades that have been applied to this weapon
