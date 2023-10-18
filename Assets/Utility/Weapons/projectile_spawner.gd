extends Node2D

@export var damage = 2
@export var speed = 100

func get_targets(): # Returns array of Area2Ds on the 3rd collision layer or null(!) if none are present
	# PS I hate nulls, if anyone knows of a better way to do this please tell me
	# - Mlodko
	if not $DetectionCircle.has_overlapping_areas():
		return null
	return $DetectionCircle.get_overlapping_areas()
	
func set_detection_radius(r : float): # r is radius of circle in [px]
	$DetectionCircle/CollisionShape2D.shape.radius = r
	
func spawn_projectile(projectileScene: Projectile):
	# projectile has to inherit the class, it ensures that there are setters for damage and speed
	# TODO should probably put collisionShape in there too
	var targets = get_targets()
	if targets == null: return
	
	var target = targets[randi() % len(targets)] # Select random target
	
	# Prepare projectile for spawn
	var projectile = projectileScene.instantiate()
	projectile.set_damage(damage)
	projectile.set_speed(speed)
	projectile.collisionShape.transform.look_at(target.transform.position)
	
	#Spawn
	$ProjectileHolder.add_child(projectile)


