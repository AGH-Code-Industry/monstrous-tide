class_name Weapon extends Node2D

@export var stat_set : StatSet
@export var possible_upgrades : Array[UpgradeTier] = []
var upgrades : Array[UpgradeTier] = []
var is_active : bool = true

@export var poss: Array[WeaponUpgrade]

func _ready() -> void:
	# connect signal to function that takes stats and adds them to current stats
	StatManager.update_player_stats_offensive.connect(add_stats)
	fill_empty_upgrades()
	# TODO add getting stats from global sources after they are implemented
	
	
		
func fill_empty_upgrades():
	# set weapon ref, max upgrades amount and upgrade weights
	upgrades.clear()
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
#	print(name)
	var available_upgrades: Array[WeaponUpgrade] = []
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
#	for up in available_upgrades:
#		print(up.name)
	return available_upgrades

func update_stats():
	print("Update stats not implemented")
	pass

func get_applied_upgrades() -> Array[UpgradeTier]:
	return upgrades
	
func get_possible_upgrades() -> Array[UpgradeTier]:
	return possible_upgrades
	
func set_upgrades_after_swap(applied : Array[UpgradeTier], possible: Array[UpgradeTier]):
	possible_upgrades = possible
	fill_empty_upgrades()
	#apply all upgrades from previous weapon to this one
	for tier in applied:
		for upgrade in tier.upgrades:
			upgrade.weapon_ref = self
			if upgrade is WeaponSwapUpgrade:
				#applying WeaponSwapUpgrade triggers this code, this is done to avoid infinite loop
				upgrade.add_upgrade_without_applying()
				print("skipped applying for swap")
				continue
			else:
				upgrade.apply_upgrade()

func remove_weapon() -> void:
	queue_free()
