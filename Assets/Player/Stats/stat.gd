class_name Stat extends Resource

enum Type{
	#Offensive
	DAMAGE = 0,
	ATTACKSPEED = 5,
	DAMAGERADIUS = 6,
	DAMAGERADIUSPERCENT = 7,
	#Defensive
	DODGE = 1,
	ARMOR = 2,
	
	#Misc
	MOVEMENTSPEED = 3,
	PICKUPRADIUS = 4,
	
	
}

func add_value(val: int):
	value += val

@export var type : Type
@export var value : int
