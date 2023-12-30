extends CanvasLayer

var slots = []
var items_number = 0
const max_items_number = 12
@onready
var grid_container = $Background/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, 12):
		slots.append(grid_container.get_child(i))
	add_item("res://Assets/Utility/UI/LvlUps/sample-item-image.png") # simulation of default weapon in eq

func add_item(image_path):
	if items_number >= max_items_number:
		return false
	items_number += 1
	return slots[items_number-1].add_item(image_path)

func remove_item():
	if items_number < 1:
		return false
	if slots[items_number-1].remove_item():
		items_number -= 1
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
