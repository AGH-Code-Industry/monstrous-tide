class_name StatSet extends Resource

@export var data: Array[Stat]

func _ready():
	for stat in data:
		if stat.more == 0:
			stat.more = 1

func add_stat(incoming_stat : Stat) -> void:
	for stat in data:
		if stat.type == incoming_stat.type:
			stat.add_stat(incoming_stat)
			return

func add_stat_array(incoming_stats: Array[Stat]) -> void:
	for incoming_stat in incoming_stats:
		for stat in data:
			if incoming_stat.type == stat.type:
				stat.add_stat(incoming_stat)
				continue

func get_stat_value(target: Stat.Type):
	for stat in data:
		if stat.type == target:
			return stat.get_final_value()
	print("Couldn't find stat ", target)
