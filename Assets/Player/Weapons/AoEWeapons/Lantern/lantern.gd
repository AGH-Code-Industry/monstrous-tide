class_name Lantern extends AoEWeapon

# components
@onready var DamageBox = $DamageBox

func _ready() -> void:
	super()
	
	update_stats()
	print(stat_set.get_stat_value(Stat.Type.DAMAGERADIUS))

func update_stats():
	self.scale = Vector2(stat_set.get_stat_value(Stat.Type.DAMAGERADIUS), stat_set.get_stat_value(Stat.Type.DAMAGERADIUS))
	DamageBox.damage = stat_set.get_stat_value(Stat.Type.DAMAGE)
	DamageBox.attack_speed = stat_set.get_stat_value(Stat.Type.ATTACKSPEED)

