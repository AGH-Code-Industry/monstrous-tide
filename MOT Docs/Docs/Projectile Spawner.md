---
extends: Node2D
---
#code/utility/spawners
# Public Methods

Return type(s)|Method|Description
-|-|-
`Array[Area2D], null`|`get_targets()`|Returns array of `Area2D`s on the *3rd* collision layer inside the `DetectionCricle` **or `null` if there aren't any**
`void`|`set_detection_radius(r : float)`|Setter for `DetectionCircle`'s radius
`float`|`get_detection_radius()`|Getter for `DetectionCircle`'s radius
`Node2D`|`spawn_projectile(projectileScene : PackedScene)`|Instantiates `projectileScene`, sets it's `global_position` to the Spawner's `global_position` and returns the instantiated projectile for further preparation. **This does not add the projectile to the scene. You have to use `add_child(new_projectile)`** (preferably in the Spawner's `ProjectileHolder`)
`Area2D`|`distance_weighted_random_choice(array : Array[Area2D], max_distance : float)`|Returns one "random" `Area2D` from `array`. The closer the target is to the Spawner the higher the chance it will get selected. **You have to ensure that the array's length is at least 1**
