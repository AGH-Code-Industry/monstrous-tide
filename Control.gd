extends Control
@onready var spiral = get_parent()
var radius : float = 0
func _process(_delta):
	radius = spiral.get_current_radius()
	queue_redraw()

func _draw():
	var color = Color(1, 0, 0)
	draw_arc(Vector2.ZERO, radius, 0, 2 * PI, 1000, color)
