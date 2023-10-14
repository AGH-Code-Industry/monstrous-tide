class_name FloatingText extends Marker2D

@onready var label : Label = get_node("Label")
@onready var tween : Tween = get_tree().create_tween()
var amount = 0
var font_color : Color = Color(1,0,0,1)
	
func _ready() -> void:
	label.text = str(amount)
	label.set_modulate(font_color)
