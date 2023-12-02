extends Node

var weapons : Array[Weapon] = []

# Used for choosing random weapon as a reward
var all_possible_weapons : Array[Weapon] = []

@onready var weapons_node = get_tree().get_first_node_in_group("player").get_node("Weapons")

func _ready() -> void:
	# Get weapons player started with
	for node in weapons_node.get_children():
		if typeof(node) == typeof(Weapon):
			weapons.append(node)


# returns specified amount of upgrades chosen randomly 
func get_randomly_chosen_upgrades(amount: int):
	var all_upgrades = []
	for weapon in weapons:
		for upgrade in weapon.get_available_upgrades():
			all_upgrades.append(upgrade)
			
	if all_upgrades.size() == 0:
		return	
	var drawn_upgrades = []
	
	for i in amount:
		var overall_chance = 0
		for upgrade in all_upgrades:
			overall_chance += upgrade.weight
		
		var random_number = randf_range(0, overall_chance)
		var offset: float = 0
		for upgrade in all_upgrades:
			if random_number < upgrade.weight + offset:
				drawn_upgrades.append(upgrade)
				break
			else:
				offset += upgrade.weight
				
	return drawn_upgrades
