extends Node

var damage_dict : Dictionary
var time_dict: Dictionary
var logger_array: Array

func _ready() -> void:
	clear_dicts()

func clear_dicts() -> void:
	damage_dict = {}
	time_dict = {}
	
func log_damage(weapon_name: String, dmg_amount: float):
	if ! damage_dict.has(weapon_name):
		damage_dict[weapon_name] = 0
		time_dict[weapon_name] = 0
	damage_dict[weapon_name] += dmg_amount
	print(damage_dict)

func _process(delta: float) -> void:
	# implement checking if player is on correct scene, eg. not shop etc.
	for weapon in time_dict.keys():
		time_dict[weapon] += delta

func get_logged_values() -> Array:
	var result = []
	for weapon in damage_dict.keys():
		result.append([weapon, damage_dict[weapon], time_dict[weapon]])
	return result

