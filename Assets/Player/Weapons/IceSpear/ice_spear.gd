extends Node2D

# The resource holds common projectile properties and it's scene
static var projectile_resource = preload("res://Assets/Player/Weapons/IceSpear/ice_spear_projectile_resource.tres")

# Storing additional projectile properties here
@export var projectile_pierce_amount = 1
@export var knockback = 100
var current_projectiles : Array[Node] = []

func _prepare_projectile(projectile : Node) -> Node:
	projectile.set_damage(projectile_resource.damage)
	projectile.speed = projectile_resource.speed
	projectile.direction = get_direction_to_target()
	if projectile.direction == null: 
		projectile.queue_free()
		return null
	projectile.knockback = knockback
	projectile.pierce_amount = projectile_pierce_amount
	return projectile

func _ready():
	$AttackTimer.wait_time = 1 / projectile_resource.attack_speed


func _on_attack_timer_timeout():
	current_projectiles.append($ProjectileSpawner.spawn_projectiles(projectile_resource.scene,
		Callable(_prepare_projectile)))
	


func get_direction_to_target():
	var targets = $ProjectileSpawner.get_targets()
	if targets == null: return null # If no enemes nearby return null
	
	# If one enemy nearby skip calculations
	elif len(targets) == 1: return global_position.direction_to(targets[0].global_position) 
	
	var target = $ProjectileSpawner.distance_weighted_random_choice(targets, 
		$ProjectileSpawner.get_detection_radius())
	return global_position.direction_to(target.global_position) # Returns Vector2 direction
	
