extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Loads image from given path to the item. Warning: do not use this method outside the Slot.gd and equipment.gd
func load_item(path):
	$MarginContainer/TextureRect.texture = load(path)
	$MarginContainer/TextureRect.size

