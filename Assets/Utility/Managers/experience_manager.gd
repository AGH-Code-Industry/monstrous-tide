extends Node

@export var points_to_levelup: int = 10
var current_points = 0
var current_level = 1

var level_up_panel = preload("res://Assets/Utility/UI/LevelUPScreen/LevelUpScreen.tscn")

func _ready():
	GameEvents.experience_collected.connect(on_experience_collected)
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
	
	
func level_up():
	current_points -= points_to_levelup
	current_level += 1
	points_to_levelup += 5
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
#	if len(get_children()) > 0:
#		await GameEvents.upgrade_selected
	var level_up_panel_instance = level_up_panel.instantiate()
	add_child(level_up_panel_instance)
	print("Stworzono karty")

	
func on_experience_collected(number_of_experience: int):
	current_points += number_of_experience
	while current_points >= points_to_levelup:
		level_up()
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
