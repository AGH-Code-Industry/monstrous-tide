extends Node

@export_range(0, 1) var drop_percent: float = .5
@export var item_scene: PackedScene 
@export var hit_box_component: Node

func _ready():
	if hit_box_component == null:
		return
	hit_box_component.on_death.connect(on_death_drop_crystal)


func on_death_drop_crystal():
	if item_scene == null || owner == null:
		return

	if randf() > drop_percent:
		return

	var owner_position = owner.global_position
	var crystal_instance = item_scene.instantiate()
	var items_layer = get_tree().get_first_node_in_group("items")
	#items_layer.add_child(crystal_instance)
	items_layer.call_deferred("add_child", crystal_instance)
	crystal_instance.global_position = owner_position
