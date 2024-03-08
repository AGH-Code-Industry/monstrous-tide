extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	get_tree().paused = true


func _on_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Assets/World/world.tscn")


func _on_exit_button_pressed():
	get_tree().quit()

