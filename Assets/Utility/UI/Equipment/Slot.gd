extends PanelContainer


var ItemClass = preload("res://Assets/Utility/UI/Equipment/item.tscn")
var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Warning: do not use this method outside the equipment.gd
func add_item(path):
	if item == null:
		item = ItemClass.instantiate()
		item.load_item(path)
		add_child(item)
		return true
	return false

# Warning: do not use this method outside the equipment.gd
func remove_item():
	if item != null:
		remove_child(item)
		item = null
		return true
	return false
