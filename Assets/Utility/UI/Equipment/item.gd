extends Node2D

# Loads image from given path to the item. Warning: do not use this method outside the Slot.gd and equipment.gd
func load_item(path):
	$MarginContainer/TextureRect.texture = load(path)

