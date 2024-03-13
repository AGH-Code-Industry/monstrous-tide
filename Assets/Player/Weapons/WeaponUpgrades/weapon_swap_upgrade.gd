class_name WeaponSwapUpgrade extends WeaponUpgrade

@export var new_weapon : PackedScene

func apply_upgrade():
	super.apply_upgrade()
	
	var applied_upgrades = weapon_ref.get_applied_upgrades()
	var possible_upgrades = weapon_ref.get_possible_upgrades()
	
	var weapon_holder_object = weapon_ref.get_parent()
	
	var new_weapon_object = new_weapon.instantiate()
	print("adding new weapon")
	weapon_holder_object.add_child(new_weapon_object)
	weapon_ref.is_active = false
	weapon_ref.remove_weapon()
	new_weapon_object.set_upgrades_after_swap(applied_upgrades, possible_upgrades)

	WeaponManager.update_weapons()
