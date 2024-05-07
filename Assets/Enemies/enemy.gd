extends CharacterBody2D


@export var movement_speed = 20.0

@onready var player = get_tree().get_first_node_in_group("player")
@onready var visuals = $Visuals
var starting_scale : float
var can_move: bool = true
@export var can_be_knockedbacked: bool = true

func _ready():
	starting_scale = visuals.scale.x

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	
	if can_move:
		velocity = direction * movement_speed
	move_and_slide()

	if direction.x > 0.1:
		visuals.scale.x = -starting_scale
	elif direction.x < 0.1:
		visuals.scale.x = starting_scale
		

func _on_hit_box_on_death() -> void:
	# Loot and xp drop functions should be added here
	SoundManager.play_enemy_death_sound()
	queue_free()

