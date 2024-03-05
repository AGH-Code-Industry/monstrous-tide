extends Weapon

@onready var bible_projectile = preload("res://Assets/Player/Weapons/Bible/bible_projectile.tscn")
@export var projectile_number = 3
@export var projectile_size = 1.0
@export var damage = 1
@export var radius = 2
@export var lifetime = 2
@export var cooldown = 3
var current_projectiles = []

func _ready():
	super()
	
	start_cycle()
	
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
	var player_position = Vector2(0, 0)
	var angle_increment = 360.0 / projectile_number

	print("Instantiate bible projectiles")
	for i in range(projectile_number):
		var angle = deg_to_rad(i * angle_increment)
		var x = radius * cos(angle)
		var y = radius * sin(angle)
		var projectile_to_add = bible_projectile.instantiate()
		projectile_to_add.position = Vector2(x,y)
		add_child(projectile_to_add)
		current_projectiles.append(projectile_to_add)

func delete_projectiles():
	print("Delete bible projectiles")
	for projectile in current_projectiles:
		projectile.queue_free()
	current_projectiles.clear()
