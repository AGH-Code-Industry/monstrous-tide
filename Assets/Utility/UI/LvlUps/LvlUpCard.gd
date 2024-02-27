extends PanelContainer

@onready var animation_player = $AnimationPlayer

var disabled = true
var upgrade: WeaponUpgrade

func _ready():
	gui_input.connect(on_input_gui)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)
	modulate = Color.TRANSPARENT
	animation_player.play("in")
	await animation_player.animation_finished
	disabled = false


func play_out_animation():
	for card in get_parent().get_children():
		card.animation_player.play("out")


func disable_cards():
	for card in get_parent().get_children():
		card.disabled = true

	
func select_card():
	upgrade.apply_upgrade()
	disable_cards()
	play_out_animation()
	await animation_player.animation_finished
	GameEvents.emit_upgrade_selected()
	

func on_input_gui(event: InputEvent):
#	modulate = Color.WHITE
	if disabled:
		return
	if event.is_action_pressed("left_click"):
		select_card()
	
	
func on_mouse_entered():
#	modulate = Color.WHITE
	if disabled:
		return
	animation_player.play("hover")


func on_mouse_exited():
#	modulate = Color.WHITE
	if disabled:
		return
	animation_player.play_backwards("hover")
