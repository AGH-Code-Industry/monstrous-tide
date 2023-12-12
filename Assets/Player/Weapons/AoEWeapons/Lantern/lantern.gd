class_name Lantern extends AoEWeapon

@export var starting_stats: Array[Stat]

# components
@onready var DamageBox = $DamageBox

func _ready() -> void:
	super()
	possible_upgrades[0].upgrades[0].apply_upgrade()
	update_stats()

func update_stats():
	self.scale = Vector2(stat_set.get_stat_value(Stat.Type.DAMAGERADIUS) *  (1 + stat_set.get_stat_value(Stat.Type.DAMAGERADIUSPERCENT) / 100), stat_set.get_stat_value(Stat.Type.DAMAGERADIUS) *  (1 + stat_set.get_stat_value(Stat.Type.DAMAGERADIUSPERCENT) / 100))
	DamageBox.damage = stat_set.get_stat_value(Stat.Type.DAMAGE)
	DamageBox.attack_speed = stat_set.get_stat_value(Stat.Type.ATTACKSPEED)

#	possible_upgrades[0].upgrades[0].apply_upgrade()

