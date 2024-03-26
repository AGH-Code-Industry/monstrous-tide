extends DropItemClass

@export var stat_to_add: Stat
	
func collect():
	StatManager.emit_player_stats_misc_update([stat_to_add], 5)
	queue_free()
	
 
