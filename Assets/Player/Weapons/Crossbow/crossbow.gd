extends Weapon

@onready var crossbow_projectile = preload("res://Assets/Player/Weapons/Crossbow/crossbow_projectile.tscn")


func _ready():
	super()
	
	start_cycle()
	
func start_cycle():
	await get_tree().create_timer(1/stat_set.get_stat_value(Stat.Type.ATTACKSPEED), false).timeout
	instantiate_projectiles()
	start_cycle()

func instantiate_projectiles():
	for i in range(stat_set.get_stat_value(Stat.Type.MULTISHOT)):
		var target = choose_closest_enemy_position()
		var projectile_to_spawn = crossbow_projectile.instantiate()
		projectile_to_spawn.global_position = global_position
		projectile_to_spawn.initialization(
			stat_set.get_stat_value(Stat.Type.DAMAGE),
			stat_set.get_stat_value(Stat.Type.DAMAGERADIUS),
			target,
			stat_set.get_stat_value(Stat.Type.PIERCE)
			)
		get_tree().get_root().add_child(projectile_to_spawn)
		await get_tree().create_timer(0.3, false).timeout
		

func choose_closest_enemy_position() -> Vector2:
	var enemies_in_range: Array[Area2D] = $DetectionArea.get_overlapping_areas()
	if enemies_in_range.size() == 0:
		# No enemies in range, return a random position within DetectionArea
		return Vector2(randf_range(global_position.x - 100, global_position.x + 100), randf_range(global_position.y - 100, global_position.y + 100))
	
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
