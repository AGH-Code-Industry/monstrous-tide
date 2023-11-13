extends CharacterBody2D

var animation_sprite: AnimatedSprite2D
var movement_speed: float = 40.0
var last_movement := Vector2.UP
@export var DEBUG_heal_value : float = 1
@export var stat_set: StatSet

# Hit indicators
@onready var bleed_particles = $BleedParticles
@export var flash_timeout : float
@export var flash_color : Color

func _ready():
	animation_sprite = get_node("AnimatedSprite2D")
	animation_sprite.play("Idle")
	StatManager.update_player_stats_misc.connect(func(receivedStats): stat_set.add_stat_array(receivedStats))

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
	velocity = mov.normalized() * stat_set.get_stat_value(Stat.Type.MOVEMENTSPEED)
	move_and_slide()

func die():
	pass
	#print("Player died")
	

func _on_hit_box_on_death() -> void:
	die()


func _on_hit_box_update_health():
	animation_sprite.modulate = flash_color
	bleed_particles.emitting = true
	await get_tree().create_timer(flash_timeout).timeout
	bleed_particles.emitting = false
	animation_sprite.modulate = Color(1,1,1)
