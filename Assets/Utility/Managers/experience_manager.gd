extends Node

func _ready():
	GameEvents.experience_collected.connect(on_experience_collected)
	
	
func on_experience_collected(number_of_experience: int):
	print(str(number_of_experience) + " experience collected")
