extends Node2D

@onready var area_2d = $Area2D
@export var experience_points: int = 1

func _ready():
	area_2d.area_entered.connect(on_area_entered)
	
	
func on_area_entered(_other_area: Area2D):
	GameEvents.emit_experience_collected(experience_points)
	queue_free()
