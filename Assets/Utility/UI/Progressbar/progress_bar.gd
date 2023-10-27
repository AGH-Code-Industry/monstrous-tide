extends CanvasLayer

@onready var progress_bar = $MarginContainer/ProgressBar


func _ready():
	GameEvents.update_experience_bar.connect(on_update_experience_bar)
	

func on_update_experience_bar(current_points: int, points_to_level_up: int):
	progress_bar.value = current_points
	progress_bar.max_value = points_to_level_up
