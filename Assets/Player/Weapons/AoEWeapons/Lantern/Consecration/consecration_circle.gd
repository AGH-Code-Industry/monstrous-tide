extends Node2D

@onready var DamageBox = $DamageBox 
@onready var duration_timer = $Duration
var stat_set: StatSet

# pass_stats is used only for the first initialization, so animations and 
# setting timer is done here
func pass_stats(passed_stats: StatSet):
	update_stats(passed_stats)
	duration_timer.wait_time = stat_set.get_stat_value(Stat.Type.DURATION)
	duration_timer.start()
	start_animation()

# update_stats is done each time stats are updated
func update_stats(passed_stats: StatSet):
	stat_set = passed_stats
	self.scale = Vector2(stat_set.get_stat_value(Stat.Type.DAMAGERADIUS), stat_set.get_stat_value(Stat.Type.DAMAGERADIUS))
	DamageBox.damage = stat_set.get_stat_value(Stat.Type.DAMAGE)
	DamageBox.attack_speed = stat_set.get_stat_value(Stat.Type.ATTACKSPEED)

func _on_duration_timeout() -> void:
	var my_tween = create_tween()
	my_tween.tween_property(self, "scale", Vector2(0, 0),0.2)
	my_tween.tween_callback(queue_free)
	
func start_animation():
	self.scale = Vector2(0,0)
	var new_scale = stat_set.get_stat_value(Stat.Type.DAMAGERADIUS)
	var my_tween = create_tween()
	my_tween.tween_property(self, "scale", Vector2(new_scale, new_scale),0.4)

func set_weapon_name(weapon_name: String):
	DamageBox.weapon_name = weapon_name
