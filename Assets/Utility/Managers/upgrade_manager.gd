extends Node

@export var experience_manager: Node
var level_up_menu = preload("res://Assets/Utility/UI/LvlUps/CardPopupMenu.tscn")


func _ready():
	experience_manager.level_up_signal.connect(on_level_up_signal)
	
	
func on_level_up_signal():
	var level_up_menu_instance = level_up_menu.instantiate()
	add_child(level_up_menu_instance)
	

