extends PanelContainer


var ItemClass = preload("res://Assets/Utility/UI/Equipment/item.tscn")
var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	if randi_range(0, 3) == 1:
		item = ItemClass.instantiate()
		item.load_item("res://Assets/Utility/UI/LvlUps/sample-item-image.png")
		add_child(item)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
