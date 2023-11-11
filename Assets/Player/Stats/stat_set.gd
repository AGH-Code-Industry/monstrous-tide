class_name StatSet extends Resource

@export var data: Array[Stat]

func _init(inc_data: Array[Stat]) -> void:
	data = inc_data

func add_stat_set(set: StatSet) -> void:
	for incoming_stat in set.data:
		for stat in data:
			if incoming_stat.type == stat.type:
				stat.add_value(incoming_stat.value) 

func add_stat(incoming_stat : Stat) -> void:
	for stat in data:
		if stat.type == incoming_stat.type:
			stat.add_value(incoming_stat.value)
			return

func add_stat_array(incoming_stats: Array[Stat]) -> void:
	for incoming_stat in incoming_stats:
		for stat in data:
			if incoming_stat.type == stat.type:
				stat.add_value(incoming_stat.value)
				continue

func get_stat(target: Stat.Type):
	for stat in data:
		if stat.type == target:
			return stat.value
	
	print("Couldn't find stat ", target)
	return -1
