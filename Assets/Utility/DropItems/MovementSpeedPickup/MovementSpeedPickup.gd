extends DropItemClass

	
func collect():

	StatManager.emit_player_stats_update({StatConstants.PlayerStats.MOVEMENTSPEED: 150}, 5)
	queue_free()
	
