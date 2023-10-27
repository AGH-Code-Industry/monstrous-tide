extends Node

signal experience_collected(number_of_experience: int)
signal update_experience_bar(current_points: int, points_to_level_up: int)


func emit_experience_collected(number_of_experience: int):
	experience_collected.emit(number_of_experience)


func emit_update_experience_bar(current_points: int, points_to_level_up: int):
	update_experience_bar.emit(current_points, points_to_level_up)
