extends Node2D
static var tornadoProjectile := load(
	"res://Assets/Player/Weapons/Tornado/tornado_projectile.tscn")
@onready var player = get_node("/root/World/Player")

@export var attack_speed: float = 4 # In attacks / s
@export var damage = 5
@export var speed = 30
@export var projectilesPerAttack = 3

func _ready():
	$AttackTimer.wait_time = 1 / attack_speed
	
	
func _on_attack_timer_timeout():
	var new_projectile = $ProjectileSpawner.spawn_projectile(tornadoProjectile)
	new_projectile.config(damage, speed, player.last_movement, attack_speed)
	$ProjectileSpawner/ProjectileHolder.add_child(new_projectile)
