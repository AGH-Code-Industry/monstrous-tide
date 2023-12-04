class_name Lantern extends AoEWeapon

@export var starting_stats: Array[Stat]

# components
@onready var DamageBox = $DamageBox

func _ready() -> void:
	super()
	possible_upgrades[0].upgrades[0].apply_upgrade()
	self.scale = Vector2(stat_set.get_stat_value(Stat.Type.PICKUPRADIUS), stat_set.get_stat_value(Stat.Type.PICKUPRADIUS))
	DamageBox.damage = stat_set.get_stat_value(Stat.Type.DAMAGE)
	DamageBox.attack_speed = stat_set.get_stat_value(Stat.Type.ATTACKSPEED)

