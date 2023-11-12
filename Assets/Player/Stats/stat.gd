class_name Stat extends Resource

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
