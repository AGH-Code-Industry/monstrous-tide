extends Node2D

@export var speed = 20

# References
var line : Line2D
var target_position : Vector2
var whip_ref : Node2D
var target_ref : Node2D

# Misc
var head : Vector2 = Vector2(0,0)
var is_returning : bool = false

func initialization(target, whip, damage):
	# references
	target_position = target.global_position - position
	target_ref = target
	line = $Line2D
	whip_ref = whip
	line.global_position = whip.global_position
	line.add_point(head)
	# stats
	$DamageBox.damage = damage
	


func _physics_process(delta):
	var player_position = whip_ref.global_position - position
	line.set_point_position(0, player_position)
	if !is_returning:
		head = head.move_toward(target_position, speed)
		line.set_point_position(1, head)
		if head.is_equal_approx(target_position):
			if target_ref.has_method("take_damage"):
				$DamageBox.deal_damage(target_ref)
			is_returning = true
	else:
		head = head.lerp(player_position, 0.3)
		line.set_point_position(1, head)
		if head.is_equal_approx(Vector2.ZERO) : queue_free()

	
