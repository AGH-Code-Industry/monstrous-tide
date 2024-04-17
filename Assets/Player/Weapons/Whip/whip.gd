extends Weapon

@onready var whip_projectile = preload("res://Assets/Player/Weapons/Whip/whip_projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	start_cycle()

func start_cycle():
	await get_tree().create_timer(4, false).timeout
	instantiate_projectiles()
	start_cycle()

func instantiate_projectiles():
	var target = choose_closest_enemy_position()
	if target == null: return
	var projectile_to_spawn = whip_projectile.instantiate()
	projectile_to_spawn.global_position = global_position
	projectile_to_spawn.initialization(
		target,
		self
		)
	get_tree().get_root().add_child(projectile_to_spawn)
	


func choose_closest_enemy_position():
	var enemies_in_range: Array[Area2D] = $DetectionArea.get_overlapping_areas()
	if enemies_in_range.size() == 0:
		# No enemies in range, return a random position within DetectionArea
		return null;
	
	# Initialize variables to store closest enemy and its distance
	var closest_enemy: Area2D = null
	var closest_distance: float = INF
	
	# Iterate through each enemy to find the closest one
	for enemy in enemies_in_range:
		var distance = global_position.distance_to(enemy.global_position)
		if distance < closest_distance:
			closest_enemy = enemy
			closest_distance = distance
	
	# Return the position of the closest enemy
	return closest_enemy.global_position
