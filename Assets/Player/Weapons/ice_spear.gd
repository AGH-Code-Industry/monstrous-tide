extends Node2D

static var iceSpearProjectile : PackedScene = load("res://Assets/Player/Weapons/ice_spear_projectile.tscn")

# Change these variables to affect projectiles
@export var timeBetweenAttacks : float = 1.0 # In seconds
@export var damage = 2
@export var projectile_speed = 100
@export var projectile_hp = 1

func _ready():
	$AttackTimer.wait_time = timeBetweenAttacks


func _on_attack_timer_timeout():
	$ProjectileSpawner.spawn_projectile(iceSpearProjectile)
