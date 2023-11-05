extends Node2D

signal update_player_stats(stats: Dictionary)

func emit_player_stats_update(stats: Dictionary, time: float = -1) -> void:
	emit_stats_with_delay(update_player_stats, stats, time)


# abstract way of emitting proper signal with specified stats
func emit_stats_with_delay(target_signal: Signal, stats: Dictionary, time: float):
	target_signal.emit(stats)

	if time > 0:
		await get_tree().create_timer(time).timeout
		target_signal.emit(negate_stats(stats))
		
# needed for adding negative stats to create short term buffs:
# first add stats, after some delay subtract them
func negate_stats(stats: Dictionary) -> Dictionary:
	var negated_stats = {}
	
	for key in stats.keys():
		negated_stats[key] = -stats[key]
	
	return negated_stats
	

# adds only stats that the object is interested in
# eg. hitbox will receive dodge and hp updates but won't register
# pickup radius increase
static func add_relevant_stats(currentStats: Dictionary, incomingStats: Dictionary) -> Dictionary:
	var updatedStats = currentStats.duplicate()

	for key in incomingStats.keys():
		if updatedStats.has(key):
			updatedStats[key] += incomingStats[key]

	return updatedStats
