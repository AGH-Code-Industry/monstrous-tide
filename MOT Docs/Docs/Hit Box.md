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
`bool`|`flash_on_hit`|If `true` - flash sprite in specified color when receiving damage
`CanvasItem`|`sprite`|Node which holds sprite that should flash when hit
`float`|`flash_timeout`|Time of color change
`Color`|`flash_color`|Color which sprite changes to during flash
`GPUParticles2D`|`bleed_particles`|Node that emits particles during flash
`float`|`regeneration_rate`|How much health to passively regenerate [health / sec]
`bool`|`regeneration_enabled`|Whether or not to regenerate health. ==DO NOT TOGGLE MANUALLY DURING PLAY== To toggle use [[#toggle_regeneration]] method.
`Timer`|`tick_timer`|Reference to a timer that triggers regeneration ticks.
# Public Methods
Return value's type|Name and arguments|Description
-|-|-
`void`|[[#take_damage]](dmg : [[Damage]])|Call this method to make the [[Hit Box]] take [[Damage]]
`void`|[[#heal]](heal_amount : float)|Call this method to heal the [[Hit Box]]
`void`|set_regenaration_rate(heal_amount : float)|Call to change `regeneration_rate`. Emits the `regeneration_update` signal.
`void`|[[#toggle_regeneration]]()|Call this to toggle regeneration on or off. Emits the `regeneration_update` signal.


## toggle_regeneration
Use this method to turn regeneration on or off during play. Emits the `regeneration_update` signal.

## take_damage
This method handles lowering health due to [[Damage]], dying, managing *i-frames*, [[Floating Text Spawner|spawning floating text]] and indicating hits via changing color and emiting particles. Emits the `update_health` signal. 

## heal
This method handles increasing health due to healing, [[Floating Text Spawner|spawns floating text]]. Emits the `update_health` signal.

# Signals
Name|Description
-|-
regeneration_update|Emitted when value of `regeneration_enabled` is changed via [[#toggle_regeneration]]().
update_health|==TODO==
on_death()|==TODO==

