extends Node2D

var weapons : Array[Weapon] = []

# Used fro choosing random weapon as a reward
var all_possible_weapons : Array[Weapon] = []

func _ready() -> void:
	# Get weapons player started with
	for node in $"../Weapons".get_children():
		if typeof(node) == typeof(Weapon):
			weapons.append(node)


# returns specified amount of upgrades chosen randomly 
func get_randomly_chosen_upgrades(amount: int):
	pass
