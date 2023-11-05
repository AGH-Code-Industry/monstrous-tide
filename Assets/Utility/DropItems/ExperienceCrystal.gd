extends DropItemClass

@export var experience_points: int = 1

	
func tween_anim_colplete():
	GameEvents.emit_experience_collected(experience_points)
	queue_free()
	
