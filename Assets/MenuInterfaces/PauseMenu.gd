extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		_on_resume_pressed()


func _on_resume_pressed():
	get_tree().paused = false
	queue_free()
	get_tree().root.set_input_as_handled()


func _on_options_button_pressed():
	print("TODO in future")


func _on_exit_button_pressed():
	get_tree().quit()


