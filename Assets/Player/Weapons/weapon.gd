class_name Weapon extends Node2D

@export var stats: Dictionary = {}
@export var possible_upgrades : Array[UpgradeTier] = []
var upgrades : Array[UpgradeTier] = []

func _ready() -> void:
	for tier in possible_upgrades:
		for upgrade in tier.upgrades:
			upgrade.weapon_ref = self
			print(upgrade.weapon_ref)



func add_stats(incoming_stats: Dictionary) -> void:
	for key in incoming_stats:
		if key not in stats:
			print("You tried adding stat that isn't used: ", key, " to: ", self.name)
			stats[key] = 0
		stats[key] += incoming_stats[key]
