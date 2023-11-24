extends Node

@export var points_to_levelup: int = 10
var current_points = 0
var current_level = 1

func _ready():
	GameEvents.experience_collected.connect(on_experience_collected)
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
	
	
func level_up():
	pass

	
func on_experience_collected(number_of_experience: int):
	print("EXP")
	var levels_to_lvlup = 0
	current_points += number_of_experience
	while current_points >= points_to_levelup:
		levels_to_lvlup += 1
		current_points -= points_to_levelup
		current_level += 1
		points_to_levelup += 5
		GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
	if levels_to_lvlup > 0:
		GameEvents.emit_level_up_signal(levels_to_lvlup)
		levels_to_lvlup = 0
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
#	print("P. to lvlup:" + str(points_to_levelup))
#	print("P. current:" + str(current_points))
#	print("P. level:" + str(current_level))
