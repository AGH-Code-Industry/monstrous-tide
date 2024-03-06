extends Weapon

@onready var bible_projectile = preload("res://Assets/Player/Weapons/Bible/bible_projectile.tscn")
@export var radius : float = 60
@export var lifetime : float = 2

# Values set by statset
var projectile_number : int = 3
var projectile_size : float = 1.0
var damage : float = 1 
var cooldown : float = 3

var current_projectiles = []

func _ready():
	super()
	
	update_stats()
	start_cycle()
	
# Assumed that statset returns value to set xD
func update_stats():
	damage = stat_set.get_stat_value(Stat.Type.DAMAGE)
	cooldown = stat_set.get_stat_value(Stat.Type.ATTACKSPEED)
	projectile_size = stat_set.get_stat_value(Stat.Type.DAMAGERADIUS)
	projectile_number = stat_set.get_stat_value(Stat.Type.DODGE) # DEBUG ONLY
	
func start_cycle():
	instantiate_projectiles()
	await get_tree().create_timer(lifetime).timeout
	delete_projectiles()
	await get_tree().create_timer(cooldown).timeout
	start_cycle()
	# instantiate projectile number of objects
	# Wait for lifetime
	# Delete all projectiles
	# after cooldown repeat

func instantiate_projectiles():
	var angle_increment : float = 360.0 / projectile_number
	for i in range(projectile_number):
		var angle : float = deg_to_rad(i * angle_increment)
		var projectile_to_add = bible_projectile.instantiate()
		projectile_to_add.position = Vector2(radius * cos(angle), radius * sin(angle))
		projectile_to_add.initialization(projectile_size, damage, angle, radius)
		add_child(projectile_to_add)
		current_projectiles.append(projectile_to_add)

func delete_projectiles():
	for projectile in current_projectiles:
		projectile.queue_free()
	current_projectiles.clear()
