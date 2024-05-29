extends MarginContainer

@onready var box_container = $VBoxContainer
var single_damage_stats: PackedScene = load("res://Assets/MenuInterfaces/MenuComponents/DamageStatsDisplayer/single_damage_stat_display.tscn")

func _ready() -> void:
	populate_box_container()

func populate_box_container() -> void:
	var damage_stats: Dictionary = DamageLogger.get_logged_values()
	print(damage_stats)
	for key in damage_stats.keys():
		var single_damage_stat_instance = single_damage_stats.instantiate()
		single_damage_stat_instance.set_damage_stats(damage_stats[key])
		box_container.add_child(single_damage_stat_instance)
