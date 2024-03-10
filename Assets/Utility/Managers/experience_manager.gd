extends Node

@export var points_to_levelup: int = 10
@export var WeaponManager: Node
@onready var card_popup_menu = $CardPopupMenu
var current_points = 0
var current_level = 1


func _ready():
	GameEvents.experience_collected.connect(on_experience_collected)
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
	card_popup_menu.WeaponManager = WeaponManager
	
	
func on_experience_collected(number_of_experience: int):
	var levels_to_lvlup = 0
	current_points += number_of_experience
	while current_points >= points_to_levelup:
		levels_to_lvlup += 1
		current_points -= points_to_levelup
		current_level += 1
		points_to_levelup += 5
		GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
	if len(card_popup_menu.h_box_container.get_children()) > 0:
		await GameEvents.upgrade_selected
	card_popup_menu.level_up(levels_to_lvlup)
	GameEvents.emit_update_experience_bar(current_points, points_to_levelup, current_level)
