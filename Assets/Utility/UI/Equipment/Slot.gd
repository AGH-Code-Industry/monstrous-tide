extends PanelContainer


var ItemClass = preload("res://Assets/Utility/UI/Equipment/item.tscn")
var item = null

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
