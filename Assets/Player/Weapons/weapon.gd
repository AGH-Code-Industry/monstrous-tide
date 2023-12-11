class_name Weapon extends Node2D

@export var stat_set : StatSet
@export var possible_upgrades : Array[UpgradeTier] = []
var upgrades : Array[UpgradeTier] = []

@export var poss: Array[WeaponUpgrade]

func _ready() -> void:
	# connect signal to function that takes stats and adds them to current stats
	StatManager.update_player_stats_offensive.connect(add_stats)
	
	# set weapon ref, max upgrades amount and upgrade weights
	for i in range(possible_upgrades.size()):
		# fill all the needed information about upgrade tiers in possible_upgrades
		possible_upgrades[i].set_weapons_refs(self)
		possible_upgrades[i].set_upgrades_weights(WeaponConstants.upgrade_tier_amount[i])
		possible_upgrades[i].set_upgrade_tier(i)
		possible_upgrades[i].set_max_upgrades(WeaponConstants.upgrade_tier_amount[i])
		
		# make sure actually applied upgrades has the same parameters as possible_upgrades
		upgrades.append(UpgradeTier.new())
		upgrades[i].set_max_upgrades(WeaponConstants.upgrade_tier_amount[i])


func add_stats(incoming_stats: Array[Stat]) -> void:
	stat_set.add_stat_array(incoming_stats)
	update_stats()
	

# returns all upgrades that can be apllied to this weapon
func get_available_upgrades() -> Array[WeaponUpgrade]:
	var available_upgrades = []
	for i in range(possible_upgrades.size()):
		# if I already have max amount of upgrades from this tier skip to next
		if upgrades[i].upgrades.size() >= upgrades[i].max_upgrades:
			continue
		# if I don't have any upgrades from this tier add all upgrades as available
		if upgrades[i].upgrades.size() == 0:
			available_upgrades.append_array(possible_upgrades[i].upgrades)
			continue
		# if I can have more upgrades from this tier, add only not already applied upgrades
		for up in possible_upgrades[i].upgrades:
			if !upgrades[i].upgrades.has(up):
				available_upgrades.append(up)
	return available_upgrades

func update_stats():
	print("Update stats not implemented")
	pass
