extends Node2D

var pause_menu = preload("res://Assets/MenuInterfaces/PauseMenu.tscn")
var game_over_menu = preload("res://Assets/MenuInterfaces/GameOverMenu.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		add_child(pause_menu.instantiate())
		get_tree().root.set_input_as_handled()


func game_over():
	add_child(game_over_menu.instantiate())
	
