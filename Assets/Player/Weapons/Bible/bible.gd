extends Weapon

@onready var bible_projectile = preload("res://Assets/Player/Weapons/Bible/bible_projectile.tscn")
@export var radius : float = 60
@export var lifetime : float = 2

var current_projectiles = []

func _ready():
	super()
	
	start_cycle()
	
func start_cycle():
	instantiate_projectiles()
	await get_tree().create_timer(lifetime).timeout
	delete_projectiles()
	await get_tree().create_timer(1 / stat_set.get_stat_value(Stat.Type.ATTACKSPEED)).timeout
	start_cycle()
	# instantiate projectile number of objects
	# Wait for lifetime
	# Delete all projectiles
	# after cooldown repeat

func instantiate_projectiles():
	var angle_increment : float = 360.0 / stat_set.get_stat_value(Stat.Type.MULTISHOT)
	for i in range(stat_set.get_stat_value(Stat.Type.MULTISHOT)):
		var angle : float = deg_to_rad(i * angle_increment)
		var projectile_to_add = bible_projectile.instantiate()
		projectile_to_add.position = Vector2(radius * cos(angle), radius * sin(angle))
		projectile_to_add.initialization(
			stat_set.get_stat_value(Stat.Type.DAMAGERADIUS),
			stat_set.get_stat_value(Stat.Type.DAMAGE),
			angle,
			radius)
		add_child(projectile_to_add)
		current_projectiles.append(projectile_to_add)

func delete_projectiles():
	for projectile in current_projectiles:
		projectile.queue_free()
	current_projectiles.clear()
