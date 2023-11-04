extends Node2D

@onready var area_2d = $Area2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var sprite_2d = $Sprite2D
@onready var timer = $Timer

var player_pickup_area

func _ready():
	area_2d.area_entered.connect(on_area_entered)
	
	
func tween_move_to_player(percent: float, start_position: Vector2):
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	
	global_position = start_position.lerp(player.global_position, percent)
	
	
func tween_anim_colplete(other_area: Area2D):
	timer.connect("timeout", on_timer_end)
	timer.start()
	player_pickup_area = other_area.get_child(0)
	player_pickup_area.shape.radius = 300
	
	
func on_timer_end():
	player_pickup_area.shape.radius = 50
	queue_free()

func disable_collision():
	collision_shape_2d.disabled = true

	
func on_area_entered(other_area: Area2D):
	Callable(disable_collision).call_deferred()
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_method(tween_move_to_player\
	.bind(global_position), 0.0, 1.0, 0.5)\
	.set_ease(Tween.EASE_IN)\
	.set_trans(Tween.TRANS_BACK)
	tween.tween_property(sprite_2d, "scale", Vector2.ZERO, 0.25).set_delay(0.35)
	tween.chain()
	
	tween.tween_callback(tween_anim_colplete.bind(other_area))
	
