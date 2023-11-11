extends Node

signal update_player_stats_misc(stats: Array[Stat])
signal update_player_stats_offensive(stats: Array[Stat])
signal update_player_stats_defensive(stats: Array[Stat])

func emit_player_stats_misc_update(stats: Array[Stat], time: float = -1) -> void:
	emit_stats_with_delay(update_player_stats_misc, stats, time)
	
func emit_player_stats_offensive_update(stats: Array[Stat], time: float = -1) -> void:
	emit_stats_with_delay(update_player_stats_offensive, stats, time)
	
func emit_player_stats_defensive_update(stats: Array[Stat], time: float = -1) -> void:
	emit_stats_with_delay(update_player_stats_defensive, stats, time)


# abstract way of emitting proper signal with specified stats
func emit_stats_with_delay(target_signal: Signal, stats: Array[Stat], time: float) -> void:
	target_signal.emit(stats)

	if time > 0:
		await get_tree().create_timer(time).timeout
		target_signal.emit(negate_stats(stats))
		
# needed for adding negative stats to create short term buffs:
# first add stats, after some delay subtract them
func negate_stats(stats: Array[Stat]) -> Array[Stat]:
		
	for stat in stats:
		stat.value = -stat.value
	
	return stats
	

# adds only stats that the object is interested in
# eg. hitbox will receive dodge and hp updates but won't register
# pickup radius increase
static func add_relevant_stats(current_stats: Dictionary, incoming_stats: Dictionary) -> Dictionary:
	var updatedStats = current_stats.duplicate()

	for key in incoming_stats.keys():
		if updatedStats.has(key):
			updatedStats[key] += incoming_stats[key]

	return updatedStats
