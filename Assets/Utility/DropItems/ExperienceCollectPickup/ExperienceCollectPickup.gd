extends DropItemClass

	
func collect():
	var stat_to_add = Stat.new()
	stat_to_add.type = Stat.Type.PICKUPRADIUS
	stat_to_add.value = 10000
	StatManager.emit_player_stats_misc_update([stat_to_add], 5)
	queue_free()
	
