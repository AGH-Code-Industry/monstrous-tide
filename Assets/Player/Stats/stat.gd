class_name Stat extends Resource

#func _init(inc_type: Type, inc_value: int) -> void:
#	type = inc_type
#	value = inc_value

enum Type{
	#Offensive
	
	#Defensive
	DODGE,
	ARMOR,
	
	#Misc
	MOVEMENTSPEED,
	PICKUPRADIUS,
}

func add_value(val: int):
	print("Value added")
	value += val

@export var type : Type
@export var value : int
