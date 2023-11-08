extends CharacterBody2D

#@onready var health_bar = $HealthBar

var animation_sprite: AnimatedSprite2D
var movement_speed: float = 40.0
var last_movement := Vector2.UP

@export var stats = {StatConstants.PlayerStats.MOVEMENTSPEED: 5}

func _ready():
	animation_sprite = get_node("AnimatedSprite2D")
	animation_sprite.play("Idle")
	StatManager.update_player_stats.connect(func(receivedStats): stats = StatManager.add_relevant_stats(stats, receivedStats))

func _physics_process(delta):
	movement()

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
	velocity = mov.normalized() * stats[StatConstants.PlayerStats.MOVEMENTSPEED]
	move_and_slide()

func die():
	pass
	#print("Player died")
	

func _on_hit_box_on_death() -> void:
	die()
