extends CanvasLayer

var level_up_card = preload("res://Assets/Utility/UI/LevelUpCard/LevelUpCard.tscn")
@onready var card_container = $%CardContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	for i in range(3):
		var level_up_card_instance = level_up_card.instantiate()
		level_up_card_instance.parent_panel = self
		card_container.add_child(level_up_card_instance)
