extends Area2D

var last_movement = Vector2.ZERO
var angle = Vector2.ZERO
var angle_less = Vector2.ZERO
var angle_more = Vector2.ZERO

# Some default values
var speed = 30
var damage = 5
var attack_speed = 2

func _ready():
	# Movement, I have absolutely no bloody idea what's going on here
	# and I won't event try to understand it as long as it works.
	var move_to_less = Vector2.ZERO
	var move_to_more = Vector2.ZERO
	$DestroyTimer.start()

	match last_movement:
		Vector2.UP, Vector2.DOWN:
			move_to_less = global_position + Vector2(randf_range(-1,-0.25), last_movement.y)*500
			move_to_more = global_position + Vector2(randf_range(0.25,1), last_movement.y)*500
		Vector2.RIGHT, Vector2.LEFT:
			move_to_less = global_position + Vector2(last_movement.x, randf_range(-1,-0.25))*500
			move_to_more = global_position + Vector2(last_movement.x, randf_range(0.25,1))*500
		Vector2(1,1), Vector2(-1,-1), Vector2(1,-1), Vector2(-1,1):
			move_to_less = global_position + Vector2(last_movement.x,
				last_movement.y * randf_range(0,0.75))*500
			move_to_more = global_position + Vector2(last_movement.x * randf_range(0,0.75),
				last_movement.y)*500

	angle_less = global_position.direction_to(move_to_less)
	angle_more = global_position.direction_to(move_to_more)
	
	var initital_tween = create_tween().set_parallel(true)
	initital_tween.tween_property(self,"scale",Vector2(1,1),3).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	var final_speed = speed
	speed = speed/5.0
	initital_tween.tween_property(self,"speed",final_speed,6).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	initital_tween.play()

	var tween = create_tween()
	var set_angle = randi_range(0,1)
	if set_angle == 1:
		angle = angle_less
		tween.tween_property(self,"angle", angle_more,2)
		tween.tween_property(self,"angle", angle_less,2)
		tween.tween_property(self,"angle", angle_more,2)
		tween.tween_property(self,"angle", angle_less,2)
		tween.tween_property(self,"angle", angle_more,2)
		tween.tween_property(self,"angle", angle_less,2)
	else:
		angle = angle_more
		tween.tween_property(self,"angle", angle_less,2)
		tween.tween_property(self,"angle", angle_more,2)
		tween.tween_property(self,"angle", angle_less,2)
		tween.tween_property(self,"angle", angle_more,2)
		tween.tween_property(self,"angle", angle_less,2)
		tween.tween_property(self,"angle", angle_more,2)
	tween.play()

func config(dmg : float, spd : float, last_mov : Vector2, atkspd: float):
	set_damage(dmg)
	speed = spd
	last_movement = last_mov
	set_attack_speed(atkspd)


func _physics_process(delta):
	global_position += angle*speed*delta

func _on_destroy_timer_timeout():
	queue_free()


func set_damage(val):
	$DamageBox.damage = val


func set_attack_speed(val):
	$DamageBox.attack_speed = val




