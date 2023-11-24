extends Node

signal experience_collected(number_of_experience: int)
signal update_experience_bar(current_points: int, points_to_level_up: int, current_level: int)
signal upgrade_selected
signal level_up_signal(levels_to_lvlup: int)


func emit_experience_collected(number_of_experience: int):
	experience_collected.emit(number_of_experience)


func emit_update_experience_bar(current_points: int, points_to_level_up: int, current_level: int):
	update_experience_bar.emit(current_points, points_to_level_up, current_level)


func emit_upgrade_selected():
	upgrade_selected.emit()


func emit_level_up_signal(levels_to_lvlup: int):
	level_up_signal.emit(levels_to_lvlup)
