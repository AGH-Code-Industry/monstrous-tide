extends Weapon


func interpolate(length, duration = 0.1):
	var tween_offset = get_tree().create_tween()
	var tween_rect_h = get_tree().create_tween()
 
	tween_offset.tween_property($Sprite2D, "offset",Vector2(0,length/2.0), duration)
	tween_rect_h.tween_property($Sprite2D, "region_rect", Rect2(16,0,95,length), duration)
	
func spark_to_enemy(enemy):
	if !enemy:
		return
	var distance = global_position.distance_to(enemy.global_position)
	look_at(enemy.global_position)
	interpolate(distance, 0.01)
	await get_tree().create_timer(0.3).timeout
	interpolate(0, 0.1)

func get_closest_enemy():
	var closest_enemy = get_tree().get_first_node_in_group("enemy")
	return closest_enemy

func _on_cuntdown_timer_timeout():
	spark_to_enemy(get_closest_enemy())
