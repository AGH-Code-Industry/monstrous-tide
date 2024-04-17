extends Weapon

@onready var whip_projectile = preload("res://Assets/Player/Weapons/Whip/whip_projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	start_cycle()

func start_cycle():
	await get_tree().create_timer(1/stat_set.get_stat_value(Stat.Type.ATTACKSPEED), false).timeout
	instantiate_projectiles()
	start_cycle()

func instantiate_projectiles():
	var targets = choose_closest_enemy_position(stat_set.get_stat_value(Stat.Type.MULTISHOT))
	if targets == null: return
	for target in targets:
		var projectile_to_spawn = whip_projectile.instantiate()
		projectile_to_spawn.global_position = global_position
		projectile_to_spawn.initialization(
			target,
			self,
			stat_set.get_stat_value(Stat.Type.DAMAGE)
			)
		get_tree().get_root().add_child(projectile_to_spawn)
		await get_tree().create_timer(0.1, false).timeout
	


func choose_closest_enemy_position(num):
	var enemies_in_range: Array[Area2D] = $DetectionArea.get_overlapping_areas()
	if enemies_in_range.size() == 0:
		# No enemies in range, return a random position within DetectionArea
		return null;
	
	enemies_in_range.sort_custom(compare_by_distance_ascending)
	
	# Return the position of the closest enemies
	return enemies_in_range.slice(0, num)

func compare_by_distance_ascending(a, b):
	# Assuming your objects have a "distance" property
	return global_position.distance_to(a.global_position) < global_position.distance_to(b.global_position)
