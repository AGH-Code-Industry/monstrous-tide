extends Node2D
static var tornadoProjectile := load(
	"res://Assets/Player/Weapons/Tornado/tornado_projectile.tscn")

@export var time_between_attacks = 4
@export var damage = 5
@export var speed = 100
@export var projectilesPerAttack = 3

func _ready():
	$AttackTimer.wait_time = time_between_attacks
	

func set_wait_time(time): # Use this method to automatically update the timer
	time_between_attacks = time 
	$AttackTimer.wait_time = time_between_attacks
	
func _on_attack_timer_timeout():
	$ProjectileSpawner.spawn_projectile(tornadoProjectile)
