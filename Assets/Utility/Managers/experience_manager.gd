extends Node

@export var points_to_levelup: int = 10
var current_points = 0
var current_level = 1

signal level_up_signal

func _ready():
	GameEvents.experience_collected.connect(on_experience_collected)
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
	
	
func level_up():
	current_points -= points_to_levelup
	current_level += 1
	points_to_levelup += 5
	level_up_signal.emit()

	
func on_experience_collected(number_of_experience: int):
	current_points += number_of_experience
	while current_points >= points_to_levelup:
		level_up()
		await GameEvents.upgrade_selected
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
