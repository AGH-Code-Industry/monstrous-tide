extends Node2D

@export var speed = 50
var line
var head = Vector2(0,0)
var target_position
var player_ref

func initialization(target, player):
	target_position = target - position
	line = $Line2D
	player_ref = player
	line.global_position = player.global_position
	line.set_point_position(0, Vector2(0,0))
	line.add_point(head)


func _physics_process(delta):
	head = head.lerp(target_position, 0.5)
	line.set_point_position(0, player_ref.global_position - position)
	line.set_point_position(1, head)
	if head.is_equal_approx(target_position): 
		queue_free()
	

func lifetime():
	await get_tree().create_timer(10).timeout
	queue_free()
