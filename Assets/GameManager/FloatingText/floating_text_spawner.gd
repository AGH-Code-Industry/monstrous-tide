class_name FloatingTextSpawner extends Node

static var current: FloatingTextSpawner = null
var floating_text = preload("res://Assets/GameManager/FloatingText/floating_text.tscn")

func _ready() -> void:
	if current:
		return
	current = self

func create_floating_text(parent: Node, text, color : Color = Color(1,1,1,1)) -> void:
	var text_instance : FloatingText = floating_text.instantiate()
	text_instance.amount = text
	text_instance.font_color = color 
	parent.add_child(text_instance)
