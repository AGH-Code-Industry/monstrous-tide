class_name WeaponSwapUpgrade extends WeaponUpgrade

@export var new_weapon : PackedScene

# get all upgrades from actual weapon
# get all possible upgrades from actual weapon
# hide current weapon
# create new weapon
# apply all upgrades

func apply_upgrade():
	super.apply_upgrade()
	
	var applied_upgrades = weapon_ref.get_applied_upgrades()
	var possible_upgrades = weapon_ref.get_possible_upgrades()
	
	var weapon_holder_object = weapon_ref.get_parent()
	
	var new_weapon_object = new_weapon.instantiate()
	weapon_holder_object.add_child(new_weapon_object)
	new_weapon_object.set_upgrades_after_swap(applied_upgrades, possible_upgrades)
	weapon_ref.queue_free()
	WeaponManager.update_weapons()
