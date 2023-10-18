extends Node2D

func get_targets(): # Returns array of Area2Ds on the 3rd collision layer or null(!) if none are present
	# PS I hate nulls, if anyone knows of a better way to do this please tell me
	# - Mlodko
	if not $DetectionCircle.has_overlapping_areas():
		return null
	return $DetectionCircle.get_overlapping_areas()
	
func set_detection_radius(r : float):
	$DetectionCircle/CollisionShape2D.shape.radius = r
	
func get_detection_radius():
	return $DetectionCircle/CollisionShape2D.shape.radius
	
func spawn_projectile(projectileScene : PackedScene) -> Node:
	# Prepare projectile for spawn
	var projectile = projectileScene.instantiate()
	projectile.global_position = global_position
	
	# Return
	return projectile

func distance_weighted_random_choice(array : Array[Area2D], max_distance : float):
	# Basically the closer the target is the higher the chance it will get targeted
	if len(array) == 1:
		return array[0]
	var i : int = 0
	while true:
		var target : Area2D = array[i % len(array)]
		if randf() >= 1 - global_position.distance_to(target.global_position) / max_distance:
			return target
		i += 1



