class_name WeaponStatUpgrade extends WeaponUpgrade

@export var stats : Array[Stat]

func apply_upgrade():
	super.apply_upgrade()
	weapon_ref.add_stats(stats)
