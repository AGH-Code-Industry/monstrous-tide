extends Node2D

@export var timeBetweenAttacks = 1.0
var IceSpear = preload("res://Assets/Player/Weapons/ice_spear.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	$IceSpearTimer.start(timeBetweenAttacks)


func _on_ice_spear_timer_timeout():
	$TargetLocation.position = Vector2(randf_range(0, 640), randf_range(0, 360))
	var newSpear = IceSpear.instantiate()
	newSpear.position = position
	
	var optionalTarget = select_nearest_target() 
	#Optional because function can return null if theres no enemies
	match optionalTarget:
		null:
			newSpear.queue_free()
			pass
		_:
			newSpear.target = optionalTarget.position
	add_child(newSpear) # TODO change this, now projectiles use local space of player


func select_nearest_target():
	var targets = $DetectionCircle.get_overlapping_areas()
	
	if len(targets) <= 0:
		return null
		
	var closestTarget = targets[0]
	var closestDistanceToTarget = (closestTarget.get_global_position() - get_global_position()).length()
	for t in targets:
		if (t.get_global_position() - get_global_position()).length() < closestDistanceToTarget:
			closestTarget = t
	
	return closestTarget
