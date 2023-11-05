extends Node2D

signal update_player_stats(stats: Dictionary)

func emit_player_stats_update(stats: Dictionary) -> void:
	update_player_stats.emit(stats)
