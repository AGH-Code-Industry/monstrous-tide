class_name Lantern extends AoEWeapon

@export var starting_stats: Array[Stat]

func _ready() -> void:
	super()
	possible_upgrades[0].upgrades[0].apply_upgrade()
	print(stat_set.get_stat_value(Stat.Type.DAMAGE))
