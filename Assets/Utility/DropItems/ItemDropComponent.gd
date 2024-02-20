extends Node

@export var hit_box_component: Node
@export var items_to_drop: Array[DropItem] = []

static var current_items_count = 0
static var item_count_limit = 1
static var last_item

func _ready():
	if hit_box_component == null:
		return
	hit_box_component.on_death.connect(on_death_drop_crystal)


func on_death_drop_crystal():
	if current_items_count < item_count_limit:
		create_item(pick_random_item())
	else:
		create_special_gem(pick_random_item())
	

func pick_random_item():
	if items_to_drop.size() == 0:
		return
		
	var overall_chance = 0
	for item in items_to_drop:
		overall_chance += item.drop_chance
	
	var random_number = randf_range(0, overall_chance)
	var offset: float = 0
	for item in items_to_drop:
		if random_number < item.drop_chance + offset:
			return item.item_scene
		else:
			offset += item.drop_chance
			
func create_item(item: PackedScene):
	current_items_count += 1
	var owner_position = owner.global_position
	var item_instance = item.instantiate()
	var items_layer = get_tree().get_first_node_in_group("items")
	items_layer.call_deferred("add_child", item_instance)
	item_instance.global_position = owner_position
	
	
func create_special_gem(item: PackedScene):
	var item_instance = item.instantiate()
	if "experience_points" in item_instance:
		print(item_instance.experience_points)
	else:
		print("NO POINTS")
	item_instance.queue_free()
