class_name LanternConsecration extends Lantern

@onready var attack_speed_timer = $AttackSpeedTimer
@export var consecration_circle: PackedScene

# todo
# make spawned circles and new circles to spawn react to received stats
func update_stats():
	attack_speed_timer.wait_time = 4 #1/stat_set.get_stat_value(Stat.Type.ATTACKSPEED)
	for child in $CircleHolder.get_children():
		child.update_stats(stat_set)


func choose_random_position() -> Vector2:
	var enemies_in_range: Array[Area2D] = $DetectionArea.get_overlapping_areas()
	if enemies_in_range.size() == 0:
		# todo clean this up
		# maybe make it so it chooses random position in DetectionArea, not with hardcoded values
		return Vector2(randf_range(global_position.x -100 , global_position.x + 100), randf_range(global_position.y -100 , global_position.y + 100))
	var random_enemy: Area2D = enemies_in_range.pick_random()
	return random_enemy.global_position


func _on_attack_speed_timer_timeout() -> void:
	var new_circle = consecration_circle.instantiate()
	$CircleHolder.add_child(new_circle)
	new_circle.global_position = choose_random_position()
	new_circle.pass_stats(stat_set)
	
