class_name Stat extends Resource

enum Type{
	#Offensive
	DAMAGE = 100,
	ATTACKSPEED = 105,
	DAMAGERADIUS = 110,
	DURATION = 115,
	
	#Defensive
	DODGE = 200,
	ARMOR = 205,
	HEALTH = 210,
	REGEN = 215,
	
	#Misc
	MOVEMENTSPEED = 300,
	PICKUPRADIUS = 305,
}

# very important to not let more value get to 0, it will make it so the stat will
# be 0 for the rest of the game
# this line prevents this from happening if the value was set to 0 in editor
func _ready():
	if self.more == 0:
		self.more = 1

func add_stat(stat: Stat) -> void:
	self.flat += stat.flat
	self.increased += stat.increased / 100
	self.more *= (1+ stat.more / 100)
	
func negate_stat() -> Stat:
	var stat_to_return: Stat = Stat.new()
	stat_to_return.type = self.type
	stat_to_return.flat = -self.flat
	stat_to_return.increased = -self.increased*100
	if self.more == 0:
		stat_to_return.more = 0
	else:
		stat_to_return.more = 1 / self.more
	print("Negate_stat inside stat, ", stat_to_return.flat)
	return stat_to_return
	
	
func get_final_value() -> float:
	if self.more == 0:
		self.more = 1
	return self.flat * (1 + self.increased) * self.more

@export var type : Type

# flat value of a stat
@export var flat : float = 1
# % increased, additive, so 20%inc and 30%inc means 50%inc, flat * 1.5
@export var increased : float = 0
# % more multiplicative, so 20%more and 30% more means flat * 1.2 * 1.3
@export var more: float = 0
