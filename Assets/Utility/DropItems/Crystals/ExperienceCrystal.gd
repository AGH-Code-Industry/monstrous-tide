extends DropItemClass

@export var experience_points: int = 1

	
func collect():
	ItemDropComponent.current_items_count -= 1
	GameEvents.emit_experience_collected(experience_points)
	queue_free()
