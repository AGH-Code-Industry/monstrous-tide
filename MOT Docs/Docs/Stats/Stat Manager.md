---
extends: Node
---

#code/utility/stats
# Description
Component responsible for handling [[Player]]'s and [[Enemy|enemies']] [[__Statistics outline__|stats]] updates using [[#Signals|signals]]. Loaded automatically to each scene.

# How to use
## Creating new signal
1. Create new signal, eg: ``
2. 
3. 

## Subscribing to signal

# Signals 

Name|Arguments and type|Description
-|-|-
`update_player_stats_misc`|stats: Dictionary|Used for misc stats like movement speed or pickup radius
`update_player_stats_offensive`|stats: Dictionary|Used for offensive stats like attack speed or AOE
`update_player_stats_defensive`|stats: Dictionary|Used for defensive stats like armor or dodge

Each signal has to have corresponding method to emit it

# Public Methods

Return value's type|Name and arguments|Description
-|-|-
`void`|`func emit_player_stats_misc_update`(stats: Dictionary, time: float)|Triggers misc stats signal
`void`|`emit_player_stats_offensive_update`(stats: Dictionary, time: float)|Triggers offensive stats signal
`void`|`emit_player_stats_defensive_update`(stats: Dictionary, time: float)|Triggers defensive stats signal
`Dictionary`|[[#add_relevant_stats]](current_stats: Dictionary, incoming_stats: Dictionary)|Triggers misc stats signal

In all the emit_ methods time is an optional parameter. 

## add_relevant_stats
This method is used to calculate all the relevant [[__Statistics outline__|stats]] for current component and add them to your current stats. Call this method in your component as a reaction to receiving signal eg: 
```
func on_pickupradius_update(new_stats):
	stats = StatManager.add_relevant_stats(stats, new_stats)
```
Newly received stats should replace current ones.
# Private Methods
Return value's type|Name and arguments|Description
-|-|-
`void`|[[# emit_stats_with_delay]](target_signal: Signal, stats: Dictionary, time: float)|used by all emit_ methods
`Dictionary`|[[#negate_stats]](stats: Dictionary)|Negates given stats

## emit_stats_with_delay
This method is used by all emit_ methods and provides logic for emitting specified signal. if time parameter is set, it will add stats for specified amount of time, and after that time remove them.

## negate_stats
Returns negative values for specified stats, used when you need to remove stats from player after specified amount of time

