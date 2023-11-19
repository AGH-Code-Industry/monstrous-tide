extends PanelContainer

var parent_panel

signal upgrade_selected


func _ready():
	gui_input.connect(on_input_gui)
	mouse_entered.connect(on_mouse_entered)
	
	
func select_card():
	print("Wybtano kartę")
	get_tree().paused = false
	print(parent_panel)
	parent_panel.queue_free()
	

func on_input_gui(event: InputEvent):
	if event.is_action_pressed("left_click"):
		select_card()

	
	
func on_mouse_entered():
	pass
