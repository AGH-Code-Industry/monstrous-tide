extends CharacterBody2D


@export var movement_speed = 20.0

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var animator = $AnimationPlayer

# Hit Indicators
@onready var bleed_particles = $BleedParticles
@export var flash_timeout : float
@export var flash_color : Color

func _ready():
	animator.play("walk")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	move_and_slide()

	if direction.x > 0.1:
		sprite.flip_h = true
	elif direction.x < 0.1:
		sprite.flip_h = false
		

func _on_hit_box_on_death() -> void:
	# Loot and xp drop functions should be added here
	#print("Enemy died")
	queue_free()

func _on_hit_box_update_health():
	print("got hit")
	sprite.modulate = flash_color
	bleed_particles.emitting = true
	await get_tree().create_timer(flash_timeout).timeout
	bleed_particles.emitting = false
	sprite.modulate = Color(1,1,1)
