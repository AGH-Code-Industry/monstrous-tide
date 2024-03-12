class_name WeaponUpgrade extends Resource

var weapon_ref : Weapon = null
var weight: int
var upgrade_tier: int

@export var name: String
@export var description: String

# this method will be overriden
func apply_upgrade():
	weapon_ref.upgrades[upgrade_tier].upgrades.append(self)
	
# this method won't be overriden
func add_upgrade_without_applying():
	weapon_ref.upgrades[upgrade_tier].upgrades.append(self)
