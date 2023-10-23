class_name FloatingText extends Marker2D

@onready var label : Label = get_node("Label")
@onready var tween : Tween = get_tree().create_tween()
var amount = 0
var font_color : Color = Color(1,0,0,1)

var velocity = Vector2(0,0)
	
func _ready() -> void:
	tween.tween_property(label, "scale", Vector2(), 1)
	tween.tween_callback(queue_free)
	
	var side_movement = randi() % 41 - 20
	velocity = Vector2(side_movement, -25)
	
	label.text = str(amount)
	label.set_modulate(font_color)

func _process(delta: float) -> void:
	position += velocity * delta
