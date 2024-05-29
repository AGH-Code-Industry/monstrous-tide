extends Line2D

var enemies_chain = []
var start_character
var end_character
var damage_amount = 3

func _ready():
	end_character = get_random_enemy()

func _process(delta):
	if is_instance_valid(start_character) and is_instance_valid(end_character):
		points[0] = to_local(start_character.global_position)
		points[1] = to_local(end_character.global_position)

func get_random_enemy():
	if !start_character:
		return null
	var enemies = get_tree().get_nodes_in_group("enemy")
	if !enemies:
		return null
	if start_character in enemies:
		enemies.erase(start_character)
	for character in enemies_chain:
		enemies.erase(character)
	var enemies_to_pick = []
	if enemies:
		for enemy in enemies:
			if enemy.global_position.distance_to(start_character.global_position) < 200:
				enemies_to_pick.append(enemy)	
	if enemies_to_pick:
		return enemies_to_pick.pick_random()
	else:
		return null
	

func get_closest_enemy():
	var enemies = get_tree().get_nodes_in_group("enemy")
	if !enemies:
		return null
	#print(start_character)
	#if start_character in enemies:
		#enemies.erase(start_character)
	for character in enemies_chain:
		enemies.erase(character)
	enemies.sort_custom(sort_closest)
	if enemies:
		return enemies.front()
	else:
		return null
	
func sort_closest(a, b):
	return a.global_position.distance_to(start_character.global_position) < b.global_position.distance_to(start_character.global_position)


func _on_life_timer_timeout():
	if start_character:
		var damage = Damage.new()
		damage.damage = damage_amount
		if start_character != get_tree().get_first_node_in_group("player") and is_instance_valid(start_character):
			start_character.get_node("HitBox").take_damage(damage)
	queue_free()
