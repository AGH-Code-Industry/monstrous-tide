extends Node

signal update_player_stats_misc(stats: Dictionary)
signal update_player_stats_offensive(stats: Dictionary)
signal update_player_stats_defensive(stats: Dictionary)

func emit_player_stats_misc_update(stats: Dictionary, time: float = -1) -> void:
	emit_stats_with_delay(update_player_stats_misc, stats, time)
	
func emit_player_stats_offensive_update(stats: Dictionary, time: float = -1) -> void:
	emit_stats_with_delay(update_player_stats_offensive, stats, time)
	
func emit_player_stats_defensive_update(stats: Dictionary, time: float = -1) -> void:
	emit_stats_with_delay(update_player_stats_defensive, stats, time)


# abstract way of emitting proper signal with specified stats
func emit_stats_with_delay(target_signal: Signal, stats: Dictionary, time: float) -> void:
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
static func add_relevant_stats(current_stats: Dictionary, incoming_stats: Dictionary) -> Dictionary:
	var updatedStats = current_stats.duplicate()

	for key in incoming_stats.keys():
		if updatedStats.has(key):
			updatedStats[key] += incoming_stats[key]

	return updatedStats
