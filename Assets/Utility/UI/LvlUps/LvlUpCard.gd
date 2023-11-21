extends PanelContainer

var parent_panel

func _ready():
	gui_input.connect(on_input_gui)
	mouse_entered.connect(on_mouse_entered)
	
	
func select_card():
	get_tree().paused = false
	GameEvents.emit_upgrade_selected()
	parent_panel.queue_free()
	

func on_input_gui(event: InputEvent):
	if event.is_action_pressed("left_click"):
		select_card()

	
	
func on_mouse_entered():
	pass
