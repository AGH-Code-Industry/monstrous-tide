class_name WeaponUpgrade extends Resource

var weapon_ref : Weapon = null
var weight: int
var upgrade_tier: int

@export var name: String
@export var description: String

func apply_upgrade():
	weapon_ref.upgrades[upgrade_tier].upgrades.append(self)
