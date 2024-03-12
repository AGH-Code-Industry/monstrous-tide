---
extends: Resource
---


*This is an object that holds data about single stat*

___
## Public methods:

Return value's type|Name and arguments|Description
-|-|-
`void`|add_stat(stat: [[Stat]])|Adds other stat with its values to this one
[[Stat]]|negate_stat()|Negates values of this stat, used for adding temporary buffs
`float`|get_final_value()|Returns value calculated with %increased and %more, generally this should be used when we want to get stat value

## Fields:

Field type|Field name|Description
-|-|-
`enum`|`Type`|This enum defines all possible stats
`Type`|`type`|Represents type of stat, like DMG or ARMOR
`float`|`flat`|Flat value of a stat
`float`|`increased`|Additive % increase
`float`|`more`|Multiplicative % increase

## Links/relations:

- Used in [[StatSet]] as in an array to represent all stats for given component