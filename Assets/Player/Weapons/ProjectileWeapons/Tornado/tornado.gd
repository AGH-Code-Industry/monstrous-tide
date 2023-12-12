extends ProjectileWeapon
static var tornadoProjectile := load(
	"res://Assets/Player/Weapons/ProjectileWeapons/Tornado/tornado_projectile.tscn")
@onready var player = get_node("/root/World/Player")

@export var attack_speed : float = 4 ## In attacks / s
@export var damage = 5 ## Damage per projectile
@export var projectile_speed = 30 ## In units / s
@export var projectilesPerAttack = 3 ## *UNIMPLEMENTED* Number of projectiles per attack

func _ready():
	$AttackTimer.wait_time = 1.0 / attack_speed
	
	
func _on_attack_timer_timeout():
	var new_projectile = $ProjectileSpawner.spawn_projectile(tornadoProjectile)
	new_projectile.config(damage, projectile_speed, player.last_movement, attack_speed)
	$ProjectileSpawner/ProjectileHolder.add_child(new_projectile)
