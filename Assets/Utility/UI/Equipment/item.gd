extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Loads image from given path to the item
func load_item(path):
	$MarginContainer/TextureRect.texture = load(path)
	$MarginContainer/TextureRect.size

# Sets texture to black half-transparent square
func remove_item():
	$MarginContainer/TextureRect.texture = load("res://Assets/Utility/UI/Equipment/EQBackground.png")
