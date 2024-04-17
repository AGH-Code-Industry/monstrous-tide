extends Node2D

@export var speed = 50
var line
var head = Vector2(0,0)
var target_position
var player_ref
var is_returning : bool = false

func initialization(target, player):
	target_position = target - position
	line = $Line2D
	player_ref = player
	line.global_position = player.global_position
	line.set_point_position(0, Vector2(0,0))
	line.add_point(head)


func _physics_process(delta):
	var player_position = player_ref.global_position - position
	line.set_point_position(0, player_position)
	if !is_returning:
		head = head.lerp(target_position, 0.7)
		line.set_point_position(1, head)
	else:
		head = head.lerp(player_position, 0.5)
		line.set_point_position(1, head)
		if head.is_equal_approx(Vector2.ZERO) : queue_free()
	if head.is_equal_approx(target_position): 
		is_returning = true
	

func lifetime():
	await get_tree().create_timer(10).timeout
	queue_free()
