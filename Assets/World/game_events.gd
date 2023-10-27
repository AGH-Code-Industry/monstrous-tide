extends Node

signal experience_collected(number_of_experience: int)


func emit_experience_collected(number_of_experience: int):
	experience_collected.emit(number_of_experience)
