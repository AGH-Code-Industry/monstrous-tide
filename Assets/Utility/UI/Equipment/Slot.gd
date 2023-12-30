extends PanelContainer


var ItemClass = preload("res://Assets/Utility/UI/Equipment/item.tscn")
var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#if randi_range(0, 3) == 1:
		#add_item("res://Assets/Utility/UI/LvlUps/sample-item-image.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_item(path):
	if item == null:
		item = ItemClass.instantiate()
		item.load_item(path)
		add_child(item)
		return true
	return false
		
	
func remove_item():
	if item != null:
		remove_child(item)
		item = null
		return true
	return false
