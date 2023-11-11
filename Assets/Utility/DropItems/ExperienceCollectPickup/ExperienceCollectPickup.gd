extends DropItemClass

	
func collect():

	StatManager.emit_player_stats_update({StatConstants.PlayerStats.PICKUPRADIUS: 10000}, 5)
	queue_free()
	
