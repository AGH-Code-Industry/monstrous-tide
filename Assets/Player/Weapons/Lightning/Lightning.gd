extends Weapon

var should_spark = false

func _process(delta):
	if should_spark:
		var closest_enemy = get_closest_enemy()
		if closest_enemy:
			$Line2D.points[1] = to_local(closest_enemy.global_position)
	else:
		$Line2D.points[1] = Vector2.ZERO
	

func interpolate(destination, duration = 0.1):
	$Line2D.points[1] = to_local(destination)
	print($Line2D.points[1])
	
	
func spark_to_enemy(enemy):
	if !enemy:
		return
	#interpolate(enemy.global_position, 0.2)

func sort_closest(a, b):
	return a.global_position.distance_to(self.global_position) < b.global_position.distance_to(self.global_position)

func get_closest_enemy():
	var enemies = get_tree().get_nodes_in_group("enemy")
	if !enemies:
		return null
	enemies.sort_custom(sort_closest)
	return enemies.front()
	
func _on_cuntdown_timer_timeout():
	$CuntdownTimer.stop()
	should_spark = true
	print(should_spark)
	spark_to_enemy(get_closest_enemy())
	$LiveTimer.start()


func _on_live_timer_timeout():
	$LiveTimer.stop()
	should_spark = false
	print(should_spark)
	$CuntdownTimer.start()
