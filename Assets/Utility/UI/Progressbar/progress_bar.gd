extends CanvasLayer

@onready var progress_bar = $MarginContainer/VBoxContainer/ProgressBar
@onready var level_info = $MarginContainer/VBoxContainer/LevelInfo


func _ready():
	GameEvents.update_experience_bar.connect(on_update_experience_bar)
	
# TODO: change function on_update_experience_bar() to on_update_ui() which will call functions like: 
# update_experience_bar
# update_level_info
# etc...
func on_update_experience_bar(current_points: int, points_to_level_up: int, current_level: int):
	progress_bar.value = current_points
	progress_bar.max_value = points_to_level_up
	level_info.text = "Level: " + str(current_level)