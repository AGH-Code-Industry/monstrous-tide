extends Node2D

static var iceSpearProjectile : PackedScene = load(
	"res://Assets/Player/Weapons/IceSpear/ice_spear_projectile.tscn")

# Change these variables to affect projectiles
@export var attack_speed : float = 2.0 # In attacks / sec
@export var damage = 2
@export var projectile_speed = 100
@export var projectile_pierce_amount = 1
@export var knockback = 100

func _ready():
	$AttackTimer.wait_time = 1 / attack_speed


func _on_attack_timer_timeout():
	var new_projectile : Node2D = $ProjectileSpawner.spawn_projectile(iceSpearProjectile)
	var direction = get_direction_to_target()
	if direction == null: 
		new_projectile.queue_free()
		return

	new_projectile.config(damage, projectile_speed, direction, attack_speed, 
		projectile_pierce_amount, knockback)
	$ProjectileSpawner/ProjectileHolder.add_child(new_projectile)


func get_direction_to_target():
	var targets = $ProjectileSpawner.get_targets()
	if targets == null: return null # If no enemes nearby return null
	# I now realize I have let something terrible out into the world.
	# The nulls shall propagate and eventually infect the whole codebase.
	# There's nothing I can do but accept my fate.
	# - Mlodko
	
	# If one enemy nearby skip calculations
	elif len(targets) == 1: return global_position.direction_to(targets[0].global_position) 
	
	var target = $ProjectileSpawner.distance_weighted_random_choice(targets, 
		$ProjectileSpawner.get_detection_radius())
	return global_position.direction_to(target.global_position) # Returns Vector2 direction
	
