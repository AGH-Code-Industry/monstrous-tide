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
	new_projectile.config(damage, projectile_speed, get_direction_to_target(), attack_speed, 
		projectile_pierce_amount, knockback)


func get_direction_to_target():
	var targets = $ProjectileSpawner.get_targets()
	if targets == null: return Vector2.UP # If no enemes nearby
	elif len(targets) == 1: return targets[0] # If one enemy nearby skip calculations
	
	var target : Vector2 = $ProjectileSpawner.distance_weighted_random_choice(targets, 
		$ProjectileSpawner.get_detection_radius())
	return global_position.direction_to(target) # Returns Vector2 direction
	
