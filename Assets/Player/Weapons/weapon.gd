class_name Weapon extends Node2D

@export var stat_set : StatSet
@export var possible_upgrades : Array[UpgradeTier] = []
var upgrades : Array[UpgradeTier] = []

func _ready() -> void:
	# set weapon ref in each upgrades to this weapon
	for tier in possible_upgrades: 
		for upgrade in tier.upgrades:
			upgrade.weapon_ref = self

func add_stats(incoming_stats: Array[Stat]) -> void:
	stat_set.add_stat_array(incoming_stats)
	
	
# returns all upgrades that can be apllied to this weapon
func get_available_upgrades():
	pass


