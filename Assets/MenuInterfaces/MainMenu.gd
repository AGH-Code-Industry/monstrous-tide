extends CanvasLayer


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Assets/World/world.tscn")


func _on_exit_button_pressed():
	get_tree().quit()

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Assets/MenuInterfaces/OptionsMenu/OptionsMenu.tscn")
