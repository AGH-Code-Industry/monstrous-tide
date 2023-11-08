extends Node2D

class_name DropItemClass

@onready var area_2d = $Area2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var sprite_2d = $Sprite2D

	
func tween_move_to_player(percent: float, start_position: Vector2, target: Node):
	global_position = start_position.lerp(target.global_position, percent)
	

func pickUp(target):
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_method(tween_move_to_player\
	.bind(global_position, target), 0.0, 1.0, 0.5)\
	.set_ease(Tween.EASE_IN)\
	.set_trans(Tween.TRANS_BACK)
	tween.tween_property(sprite_2d, "scale", Vector2.ZERO, 0.25).set_delay(0.35)
	tween.chain()
	
	# TODO Temporary soltion. In the future check if there is a better one
	area_2d.collision_layer = 16
