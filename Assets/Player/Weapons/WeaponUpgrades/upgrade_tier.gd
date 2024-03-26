class_name UpgradeTier extends Resource

@export var upgrades : Array[WeaponUpgrade] = []
var max_upgrades: int = 0

func set_upgrades_weights(upgrade_weight: int) -> void:
	for up in upgrades:
		up.weight = upgrade_weight
		
func set_weapons_refs(ref: Weapon) -> void:
	for up in upgrades:
		up.weapon_ref = ref
		
func set_upgrade_tier(tier: int) -> void:
	for up in upgrades:
		up.upgrade_tier = tier
		
func set_max_upgrades(amount: int) -> void:
	max_upgrades = amount
