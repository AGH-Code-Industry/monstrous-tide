extends CharacterBody2D

#@onready var health_bar = $HealthBar

var animation_sprite: AnimatedSprite2D
var movement_speed: float = 40.0
var last_movement := Vector2.UP
@export var DEBUG_heal_value : float = 1

func _ready():
	animation_sprite = get_node("AnimatedSprite2D")
	animation_sprite.play("Idle")

func _physics_process(_delta):
	movement()
	
# FOR DEBUG PURPOSES
func _process(_delta):
	if Input.is_action_just_pressed("DEBUG_manual_heal"): 
		$HitBox.heal(DEBUG_heal_value)
		print("Manual heal (+" + str(DEBUG_heal_value) + "), current health " + str($HitBox.health) + " / " + str($HitBox.max_health))

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov)
	
	if mov != Vector2.ZERO:
		last_movement = mov
		animation_sprite.play("Walk")
		if mov[0] > 0:
			animation_sprite.flip_h = true
		elif mov[0] < 0:
			animation_sprite.flip_h = false
	else:
		animation_sprite.play("Idle")
	velocity = mov.normalized() * movement_speed
	move_and_slide()

func die():
	pass
	#print("Player died")
	

func _on_hit_box_on_death() -> void:
	die()
