extends Line2D

var enemies_chain = []
var start_character
var end_character

func _ready():
	#print(enemies_chain)
	end_character = get_closest_enemy()

func _process(delta):
	if is_instance_valid(start_character) and is_instance_valid(end_character):
		points[0] = to_local(start_character.global_position)
		points[1] = to_local(end_character.global_position)

func get_closest_enemy():
	var enemies = get_tree().get_nodes_in_group("enemy")
	if !enemies:
		return null
	if start_character in enemies:
		enemies.erase(start_character)
	for character in enemies_chain:
		enemies.erase(character)
	enemies.sort_custom(sort_closest)
	return enemies.front()
	
func sort_closest(a, b):
	return a.global_position.distance_to(start_character.global_position) < b.global_position.distance_to(start_character.global_position)


func _on_life_timer_timeout():
	if start_character:
		var damage = Damage.new()
		damage.damage = 3
		if start_character != get_tree().get_first_node_in_group("player"):
			start_character.get_node("HitBox").take_damage(damage)
	queue_free()
