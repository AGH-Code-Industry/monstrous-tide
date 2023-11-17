extends CanvasLayer

var level_up_card = preload("res://Assets/Utility/UI/LevelUpCard/LevelUpCard.tscn")
@onready var card_container = $MarginContainer/CardContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(3):
		var level_up_card_instance = level_up_card.instantiate()
		card_container.add_child(level_up_card_instance)
