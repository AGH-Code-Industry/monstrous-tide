class_name FloatingTextSpawner extends Node

enum text_types {
	DAMAGE,
	CRITICAL,
	HEALING
}

static var floating_text = preload("res://Assets/Utility/FloatingText/floating_text.tscn")


static func create_floating_text(parent: Node, text, type: text_types) -> void:
	var text_instance : FloatingText = floating_text.instantiate()
	text_instance.amount = text
	
	var color = Color(1,1,1,1)
	match type:
		text_types.DAMAGE:
			color = Color(1,0,0,1)
	
	text_instance.font_color = color 
	parent.add_child(text_instance)
