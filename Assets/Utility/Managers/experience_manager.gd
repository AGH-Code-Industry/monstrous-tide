extends Node

@export var points_to_levelup: int = 10
var current_points = 0
var current_level = 0


func _ready():
	GameEvents.experience_collected.connect(on_experience_collected)
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup)
func level_up():
	print("New level!")
	current_level += 1
	current_points -= points_to_levelup
	points_to_levelup += 5

	
func on_experience_collected(number_of_experience: int):
	current_points += number_of_experience
	if current_points >= points_to_levelup:
		level_up()
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup)
