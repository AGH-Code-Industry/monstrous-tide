___

*This objects represents all stats for given component*
___

## methods:

Return value's type|Name and arguments|Description
-|-|-
`void`|add_stat_array(incoming_stats: Array[Stat])|Call this method to add array of stats to the current stats. They have to be in form of Array[Stats]
`float`|get_stat_value(target: Stat.Type)|Returns the value of specified stat in this StatSet. If it's not there, "Stat not found" will be printed
## fields:

Field type|Field name|Description
-|-|-
Array of [[Stat]]|`data`|Holds all stats for given component

