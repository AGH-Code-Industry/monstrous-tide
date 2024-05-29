extends HBoxContainer

var label: Label

func set_damage_stats(damage_stat: Array) -> void:
	label = $Label
	var damage_string = sanitize_value(damage_stat[0])
	var dps_string = sanitize_value(damage_stat[0]/damage_stat[1])
	label.text = "Damage: " + damage_string + "\nDPS: " + dps_string


# make number more readible for  humans
func sanitize_value(value: int) -> String:
	if value > 10**6:
		return str(snapped(value / 10**6, 0.01)) + "M"
	elif value > 10**3:
		return str(snapped(value / 10**3, 0.01)) + "K"
	else:
		return str(value)
