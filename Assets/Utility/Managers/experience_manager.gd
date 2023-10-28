extends Node

@export var points_to_levelup: int = 10
var current_points = 0
var current_level = 1


func _ready():
	GameEvents.experience_collected.connect(on_experience_collected)
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
	
	
func level_up():
	current_points -= points_to_levelup
	current_level += 1
	points_to_levelup += 5
#	print("Level: " + str(current_level))
#	print("Current points: " + str(current_points))
#	print("Points to next level: " + str(points_to_levelup))
#	print("--------------------------")

	
func on_experience_collected(number_of_experience: int):
	current_points += number_of_experience
	while current_points >= points_to_levelup:
		level_up()
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
