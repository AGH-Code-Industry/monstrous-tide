extends Node

#@export_range(0, 1) var drop_percent: float = .5
#@export var item_scene: PackedScene 
@export var hit_box_component: Node
@export var items_to_drop: Array[DropItem] = []

func _ready():
	if hit_box_component == null:
		return
	hit_box_component.on_death.connect(on_death_drop_crystal)


func on_death_drop_crystal():
#	if item_scene == null || owner == null:
#		return
#
#	if randf() > drop_percent:
#		return
#
#	var owner_position = owner.global_position
#	var crystal_instance = item_scene.instantiate()
#	var items_layer = get_tree().get_first_node_in_group("items")
#	items_layer.add_child(crystal_instance)
#	items_layer.call_deferred("add_child", crystal_instance)
#	crystal_instance.global_position = owner_position
	pick_random_item()
	

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
			create_item(item.item_scene)
			return
		else:
			offset += item.drop_chance
			
func create_item(item: PackedScene):
	var owner_position = owner.global_position
	var item_instance = item.instantiate()
	var items_layer = get_tree().get_first_node_in_group("items")
	items_layer.call_deferred("add_child", item_instance)
	item_instance.global_position = owner_position
