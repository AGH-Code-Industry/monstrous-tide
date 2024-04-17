extends Node

var damage_dict : Dictionary
var time_dict: Dictionary

func _ready() -> void:
	clear_dicts()

func clear_dicts() -> void:
	damage_dict = {}
	time_dict = {}

func log_damage(weapon_name: String, dmg_amount: float):
	if ! damage_dict.has(weapon_name):
		damage_dict[weapon_name] = 0
	damage_dict[weapon_name] += dmg_amount
	print(damage_dict)

func log_pickup_time(weapon_name: String):
	pass #time_dict[weapon_name] = 

func _process(delta: float) -> void:
	pass #print(Time.get_ticks_usec())
