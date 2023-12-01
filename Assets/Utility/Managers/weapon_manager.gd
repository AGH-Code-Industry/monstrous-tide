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
	var player = get_tree().get_first_node_in_group("player")
	var upgrades = []
	for weapon in player.get_node("Weapons").get_children():
		print(weapon)
