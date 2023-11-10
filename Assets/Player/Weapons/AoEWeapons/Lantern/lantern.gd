class_name Lantern extends AoEWeapon

@export var starting_stats: Dictionary = {StatConstants.PlayerStats.PICKUPRADIUS : 5}

func _ready() -> void:
	super()
	add_stats(starting_stats)
	possible_upgrades[0].upgrades[0].apply_upgrade()
