Description: `DropItem` is a class that all droppable objects inherit from.

### Variables:
- `@onready var area_2d = $Area2D` - collision area existing in layer 4 (layer for drop items).
- `@onready var sprite_2d = $Sprite2D` - Sprite containing object's image. Also used in picking up animation in `pickUp()` function.
### Functions:
- `pickUp(target)` - called by `player`'s `pickup_component`. This function is calls `tween` (picking up animation) and changes objects collision layer so it no longer collides which `player`'s `pickup_component`. `target` argument is reference to object passed to `tween_move_to_player()` method.
- `tween_move_to_player(percen: float, start_position: Vector2, target: Node)` - method responsible for moving (in animation) to `target` location. Called in `pickUp()` function.
- `collect()` - function meant to be override in children classes to add different functionality. Function's purpose is to do it's functionality stuff (only in overridden methods) and destroy `DropItem` when player collides with it and animation almost ends.