extends Node

var damage_dict : Dictionary
@onready var timer: Timer = $Timer

func _ready() -> void:
	clear_dicts()

func clear_dicts() -> void:
	damage_dict = {}
	
func log_damage(weapon_name: String, dmg_amount: float):
	if ! damage_dict.has(weapon_name):
		damage_dict[weapon_name] = [0, 0]
	damage_dict[weapon_name][0] += dmg_amount

func get_logged_values() -> Dictionary:
	return damage_dict

# time passed calculated once per second, no need to do it in _process
func _on_timer_timeout() -> void:
	# implement checking if player is on correct scene, eg. not shop etc.
	for weapon in damage_dict.keys():
		damage_dict[weapon][1] += timer.wait_time
