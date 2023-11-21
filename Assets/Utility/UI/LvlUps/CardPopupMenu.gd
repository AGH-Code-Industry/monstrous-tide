extends CanvasLayer

var level_up_card = preload("res://Assets/Utility/UI/LvlUps/LvlUpCard.tscn")
@onready var h_box_container = $MarginContainer/HBoxContainer


func _ready():
	
	get_tree().paused = true
	for i in range(3):
		var level_up_card_instance = level_up_card.instantiate()
		level_up_card_instance.parent_panel = self
		h_box_container.add_child(level_up_card_instance)
