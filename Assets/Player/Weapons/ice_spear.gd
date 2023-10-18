extends Node2D

static var iceSpearProjectile : PackedScene = load("res://Assets/Player/Weapons/ice_spear_projectile.tscn")
@export var timeBetweenAttacks : float = 1.0 # In seconds

func _ready():
	$AttackTimer.wait_time = timeBetweenAttacks


func _on_attack_timer_timeout():
	$ProjectileSpawner.spawn_projectile(iceSpearProjectile)
