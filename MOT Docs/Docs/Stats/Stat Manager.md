---
extends: Node
---

# Description
Component responsible for handling [[Player]]'s and [[Enemy|enemies']] [[General statistics outline|stats]] updates using [[#Signals|signals]]. Loaded automatically to each scene.

## How to use
1. Create new signal
2. Add the method to call from other scripts that emits given signal 
3. In script that uses stats subscribe to specified signal, eg. `StatManager.update_player_stats_misc.connect(on_pickupradius_update)`
4. Call the method from script to trigger signal, eg. `StatManager.emit_player_stats_misc_update([stat_to_add], 5)` here we will add array which consists of only one stat, for 5 seconds (time is an optional parameter, not using it will result in stat being pernament)

# Signals 

Name|Arguments and type|Description
-|-|-
`update_player_stats_misc`|stats: Array\[[[Stat]]\]|Used for misc stats like movement speed or pickup radius
`update_player_stats_offensive`|stats: Array\[[[Stat]]\]|Used for offensive stats like attack speed or AOE
`update_player_stats_defensive`|stats: Array\[[[Stat]]\]|Used for defensive stats like armor or dodge

Each signal has to have corresponding method to emit it

# Public Methods

Return value's type|Name and arguments|Description
-|-|-
`void`|`func emit_player_stats_misc_update`(stats: Array[Stat], time: float)|Triggers misc stats signal
`void`|`emit_player_stats_offensive_update`(stats: Array[Stat], time: float)|Triggers offensive stats signal
`void`|`emit_player_stats_defensive_update`(stats: Array[Stat], time: float)|Triggers defensive stats signal

In all the emit_ methods time is an optional parameter, specifing for how long the stats will be added.

# Private Methods
Return value's type|Name and arguments|Description
-|-|-
`void`|[[# emit_stats_with_delay]](target_signal: Signal, stats: Array[Stat], time: float)|used by all emit_ methods
`Array[Stat]`|[[#negate_stats]](stats: Array[Stat])|Negates given stats

## emit_stats_with_delay
This method is used by all emit_ methods and provides logic for emitting specified signal. if time parameter is set, it will add stats for specified amount of time, and after that time remove them.

## negate_stats
Returns negative values for specified stats, used when you need to remove stats from player after specified amount of time
