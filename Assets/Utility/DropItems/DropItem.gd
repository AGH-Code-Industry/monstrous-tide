extends Node2D

class_name DropItemClass

@onready var area_2d = $Area2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var sprite_2d = $Sprite2D

	
func tween_move_to_player(percent: float, start_position: Vector2, target: Node):
	global_position = start_position.lerp(target.global_position, percent)
	

func pickUp(target):
	var time_to_pick = global_position.distance_to(target.global_position) / 100
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_method(tween_move_to_player\
	.bind(global_position, target), 0.0, 1.0, time_to_pick)\
	.set_ease(Tween.EASE_IN)\
	.set_trans(Tween.TRANS_BACK)
	tween.tween_property(sprite_2d, "scale", Vector2.ZERO, 0.35).set_delay(time_to_pick-.15)
	tween.chain()
	
	# layers are saved in bit format so bitwise operation is used to remove 
	#layer 4 responsible for pickup
	area_2d.collision_layer &= ~(1 << 3)
	
func collect():
	queue_free()
