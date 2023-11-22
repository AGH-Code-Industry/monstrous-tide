extends PanelContainer

@onready var animation_player = $AnimationPlayer

var parent_panel
var disabled = true

func _ready():
	gui_input.connect(on_input_gui)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)
	modulate = Color.TRANSPARENT
	animation_player.play("in")
	await animation_player.animation_finished
	disabled = false

	
func select_card():
	disabled = true
	for card in get_parent().get_children():
		if card == self:
			continue
		card.animation_player.play("out")
	animation_player.play("out")
	await animation_player.animation_finished
	get_tree().paused = false
	GameEvents.emit_upgrade_selected()
	parent_panel.queue_free()
	

func on_input_gui(event: InputEvent):
	modulate = Color.WHITE
	if event.is_action_pressed("left_click"):
		select_card()

	
	
func on_mouse_entered():
	modulate = Color.WHITE
	if disabled:
		return
	animation_player.play("hover")


func on_mouse_exited():
	modulate = Color.WHITE
	if disabled:
		return
	animation_player.play_backwards("hover")
