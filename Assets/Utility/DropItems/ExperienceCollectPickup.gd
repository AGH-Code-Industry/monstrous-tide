extends DropItemClass

@onready var timer = $Timer

var player_pickup_area
var player_pickup_area_origin_size

	
func collect():

	print("PowerUp")
	StatManager.emit_player_stats_update({StatConstants.PlayerStats.PICKUPRADIUS: 10000}, 5)
	queue_free()
	
