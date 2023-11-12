class_name WeaponStatUpgrade extends WeaponUpgrade

@export var stats : Array[Stat]

func apply_upgrade():
	print("tried adding upgrade")
	print(weapon_ref)
	weapon_ref.add_stats(stats)
