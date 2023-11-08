---
extends: Area2D
---
#code/utility

# Description
A node which handles detection and managing of *receiving* damage and healing. Heavily connected to [[Damage Box]]
# Fields
Field type|Field name|Description
-|-|-
`CollisionShape2D`|`collision`|Node which defines the [[Hit Box]]'s shape
`Timer`|`disableTimer`|Node handling *i-frames*
`float`|`max_health`|Maximum health value
`float`|`health`|Current health value
`bool`|`show_damage_taken_numbers`|If `true` - render [[Floating Text]] for receiving [[Damage]]
`bool`|`show_heal_numbers`|If `true` - render [[Floating Text]] for receiving healing

# Public Methods
Return value's type|Name and arguments|Description
-|-|-
`void`|[[#take_damage]](dmg : [[Damage]])|Call this method to make the [[Hit Box]] take [[Damage]]
`void`|[[#heal]](heal_amount : float)|Call this method to heal the [[Hit Box]]

## take_damage
This method handles lowering health due to [[Damage]], dying, managing *i-frames* and [[Floating Text Spawner|spawning floating text]]. Emits the `update_health` signal.

## heal
This method handles increasing health due to healing, [[Floating Text Spawner|spawns floating text]]. Emits the `update_health` signal.

# Signals
Name|Description
-|-
update_health|==TODO==
on_death()|==TODO==

