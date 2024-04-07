extends Node

var weapons : Array[Weapon] = []

# Used for choosing random weapon as a reward
@onready var all_possible_weapons = [
	{
		"weight": 1,
		"name": "Bible",
		"description": "Bible weapon",
		"scene": "res://Assets/Player/Weapons/Bible/bible.tscn"
	},
	{
		"weight" :1,
		"name": "crossbow",
		"description": "Handy Crossbow",
		"scene": "res://Assets/Player/Weapons/Crossbow/crossbow.tscn"
	},
]
var avoid_weapons: Array

var weapons_node

func _ready() -> void:
	if get_tree().current_scene.name == "World":
		weapons_node = get_tree().get_first_node_in_group("player").get_node("Weapons")
		update_weapons()
	


func get_all_upgrades():
	update_weapons()
	var all_upgrades = []
	for weapon in weapons:
		if weapon != null:
			all_upgrades.append_array(weapon.get_available_upgrades())
	return all_upgrades

# returns specified amount of upgrades chosen randomly 
func get_randomly_chosen_upgrades(amount: int, avoided_upgrades = []):
	# Geting upgrades from each weapon
	var all_upgrades = get_all_upgrades() + all_possible_weapons
	avoided_upgrades += avoid_weapons
	for avoid_upgrade in avoided_upgrades:
		if avoid_upgrade in all_upgrades:
			all_upgrades.erase(avoid_upgrade)
	# Checking if array of upgrades is empty	
	if all_upgrades.size() == 0:
		return	
	# Array for drawn upgrades
	var drawn_upgrades = []
	# Drawing cards by their weight
	for i in amount:
		var overall_chance = 0
		for upgrade in all_upgrades:
			overall_chance += upgrade.weight	
		var random_number = randf_range(0, overall_chance)
		var offset: float = 0
		for upgrade in all_upgrades:
			if random_number < upgrade.weight + offset:
				drawn_upgrades.append(upgrade)
				all_upgrades.erase(upgrade)
				break
			else:
				offset += upgrade.weight
				
	return drawn_upgrades
	
func update_weapons():
	weapons.clear()
	for node in get_tree().get_first_node_in_group("player").get_node("Weapons").get_children():
		if typeof(node) == typeof(Weapon):
			if node.is_active:
				weapons.append(node)
