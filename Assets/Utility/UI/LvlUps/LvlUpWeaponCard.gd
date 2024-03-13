extends TextureRect

@onready var animation_player = $AnimationPlayer
@export var healing_amount : float = 5

var disabled = true
var upgrade: WeaponUpgrade
var weapon

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
	#print(weapon)
	get_tree().get_first_node_in_group("player").get_node("Weapons").add_child(load(weapon).instantiate())
	disable_cards()
	play_out_animation()
	await animation_player.animation_finished
	GameEvents.emit_upgrade_selected()
	

func on_input_gui(event: InputEvent):
	if disabled:
		return
	if event.is_action_pressed("left_click"):
		select_card()
	
	
func on_mouse_entered():
	if disabled:
		return
	animation_player.play("hover")


func on_mouse_exited():
	if disabled:
		return
	animation_player.play_backwards("hover")
