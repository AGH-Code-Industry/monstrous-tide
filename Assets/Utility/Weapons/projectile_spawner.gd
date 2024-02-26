## This class handles the targeting and spawning of projectiles.
## It's [Node] should be a child of the weapon [Node]
extends Node2D

func _default_map_func(projectile : Node) -> Node:
	projectile.global_position = global_position
	return projectile

func _default_filter_func(_x):
	return true

## The maximum distance a thing can be targeted from.
@export var detection_radius : float = 100.0 :
	set(value):
		$DetectionCircle/CollisionShape2D.shape.radius = value
		detection_radius = value
		return
	get:
		return detection_radius


## Returns the [Area2D]s on the 3rd collision layer. 
## Optionally you can pass in a [Callable] that somehow filters the Area2Ds 
## if not provided, it will return all the Area2Ds
## The filter functions should:
## - take a single Variant argument
## - return a boolean
func get_targets(filter_func := Callable(_default_filter_func)):
	if not $DetectionCircle.has_overlapping_areas():
		return null
	return $DetectionCircle.get_overlapping_areas().filter(filter_func)
	
## Instantiates the projectile(s) according to the information inside the [Projectile] resource.
## Returns an [Array[Node]] of the instantiated projectiles.  [br]
## Optionally you can pass in a [param map_func] [Callable] that modifies the instantiation process. [br]
## The map functions should: [br]
## - take a single Variant argument [br]
## - return a Node
func spawn_projectile(projectile : Projectile, map_func := Callable(_default_map_func)) -> Array[Node]:
	var projectiles : Array[Node] = []

	# Instatiate the projectiles
	for i in range(projectile.projectiles_per_attack):
		var new_projectile = projectile.scene.instantiate()
		projectiles.append(new_projectile)

	# Prepare the projectiles for spawn
	projectiles = projectiles.map(map_func)

	# Return
	return projectiles

## Returns a pseudo-random [Area2D] from the [param array] [b] or a [null] if none were found/passed the filter [/b].
## The closer the target is, the higher the chance it will get targeted. [br]
## Optionally you can pass in a [param filter_func] [Callable] that somehow filters the Area2Ds
## if not provided, it will return all the Area2Ds
## The filter functions should: [br]
## - take a single Variant argument [br]
## - return a boolean
func distance_weighted_random_choice(array : Array[Area2D], max_distance : float, filter_func := Callable(_default_filter_func)):
	# Filter the array
	array = array.filter(filter_func)

	# Idiot(me)-proofing
	if len(array) == 0:
		return null
	
	# Basically the closer the target is the higher the chance it will get targeted
	if len(array) == 1:
		return array[0]
	var i : int = 0
	while true:
		var target : Area2D = array[i % len(array)]
		if randf() >= 1 - global_position.distance_to(target.global_position) / max_distance:
			return target
		i += 1



