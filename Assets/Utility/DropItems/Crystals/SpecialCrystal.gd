extends DropItemClass

static var experience_points: int = 1

	
func collect():
	GameEvents.emit_experience_collected(experience_points)
	queue_free()


func _process(_delta):
	$Label.text = str(experience_points)
