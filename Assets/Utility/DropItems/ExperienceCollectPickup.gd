extends DropItemClass

@onready var timer = $Timer

var player_pickup_area
var player_pickup_area_origin_size

	
func tween_anim_colplete():
#	timer.connect("timeout", on_timer_end)
#	timer.start()
#	player_pickup_area = other_area.get_child(0)
#	player_pickup_area_origin_size = player_pickup_area.shape.radius
#	player_pickup_area.shape.radius = 300
	print("PowerUp")
	
	
#func on_timer_end():
#	player_pickup_area.shape.radius = player_pickup_area_origin_size
#	queue_free()
