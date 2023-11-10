extends DropItemClass

	
func collect():

	print("PowerUp")
	StatManager.emit_player_stats_misc_update({StatConstants.PlayerStats.PICKUPRADIUS: 10000}, 5)
	queue_free()
	
