extends Node2D

var pause_menu = preload("res://Assets/MenuInterfaces/PauseMenu.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		add_child(pause_menu.instantiate())
		get_tree().root.set_input_as_handled()
