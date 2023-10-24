extends TextureProgressBar

@export var hit_box_component: Node
@export var shoow_health_bar: bool = true

func _ready():
	if hit_box_component == null:
		return
	if shoow_health_bar == false:
		visible = false
	hit_box_component.update_health.connect(on_update_health)
	max_value = hit_box_component.health
	value = max_value
	

func on_update_health():
	if shoow_health_bar == false || hit_box_component == null:
		return
	value = hit_box_component.health
