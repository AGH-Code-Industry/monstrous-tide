class_name Lantern extends AoEWeapon

# components
@onready var DamageBox = $DamageBox
@onready var VFX = $Sprite2D

func _ready() -> void:
	super()
	update_stats()

func update_stats():
	self.scale = Vector2(stat_set.get_stat_value(Stat.Type.DAMAGERADIUS), stat_set.get_stat_value(Stat.Type.DAMAGERADIUS))
	DamageBox.damage = stat_set.get_stat_value(Stat.Type.DAMAGE)
	DamageBox.attack_speed = stat_set.get_stat_value(Stat.Type.ATTACKSPEED)
	DamageBox.knocback = stat_set.get_stat_value(Stat.Type.KNOCKBACK)
