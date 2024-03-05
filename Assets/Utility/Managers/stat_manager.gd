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
	for i in range(stats.size()):
		stats[i] = stats[i].negate_stat()
	return stats
