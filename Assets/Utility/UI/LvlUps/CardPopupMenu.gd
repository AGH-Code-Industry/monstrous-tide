extends CanvasLayer

@onready var h_box_container = $MarginContainer/HBoxContainer
@export var cards_to_draw_count = 3
var level_up_card = preload("res://Assets/Utility/UI/LvlUps/LvlUpCard2.tscn")
var healing_card = preload("res://Assets/Utility/UI/LvlUps/LvlUpHealingCard.tscn")
var WeaponManager: Node
var current_upgrades
var colors = {
	"green": "res://Assets/Utility/UI/LvlUps/Textures/card_green.png",
	"blue": "res://Assets/Utility/UI/LvlUps/Textures/card_blue.png",
	"purple": "res://Assets/Utility/UI/LvlUps/Textures/card_purple.png",
	"yellow": "res://Assets/Utility/UI/LvlUps/Textures/card_yellow.png"
}

func create_cards(avoided_upgrades = []):
	visible = true
	if WeaponManager == null:
		return
	current_upgrades = WeaponManager.get_randomly_chosen_upgrades(cards_to_draw_count, avoided_upgrades)
	if current_upgrades == null:
		get_tree().paused = false
		return
	for upgrade in current_upgrades:
		var level_up_card_instance = level_up_card.instantiate()
		level_up_card_instance.upgrade = upgrade
		level_up_card_instance.get_node("%ItemName").text = str(upgrade.name)
		level_up_card_instance.get_node("%ItemDescription").text = str(upgrade.description)

		match upgrade.upgrade_tier:
			0:
				level_up_card_instance.texture = load(colors["green"])
			1:
				level_up_card_instance.texture = load(colors["blue"])
			2:
				level_up_card_instance.texture = load(colors["purple"])
			3:
				level_up_card_instance.texture = load(colors["yellow"])
		
		h_box_container.add_child(level_up_card_instance)
	
	if len(current_upgrades) < cards_to_draw_count:
		var i = 0
		while i < cards_to_draw_count - len(current_upgrades):
			var healing_card_instance = healing_card.instantiate()
			h_box_container.add_child(healing_card_instance)
			i+=1
		
		
func remove_cards():
	for card in h_box_container.get_children():
		card.queue_free()
	if len(WeaponManager.get_all_upgrades()) - len(current_upgrades) <= 0:
		%RerollButton.disabled = true
	visible = false


func level_up(levels_to_lvlup: int):
	if len(h_box_container.get_children()) > 0:
		await GameEvents.upgrade_selected
	for i in levels_to_lvlup:
		if len(WeaponManager.get_all_upgrades()) == 0:
			return
		get_tree().paused = true
		create_cards()
		await GameEvents.upgrade_selected
		remove_cards()
		get_tree().paused = false


func _on_reroll_button_pressed():
	var upgrades_left_count = len(WeaponManager.get_all_upgrades()) - len(current_upgrades)
	if !(upgrades_left_count > len(current_upgrades)):
		while (len(current_upgrades) - upgrades_left_count):
			current_upgrades.remove_at(len(current_upgrades)-1)
	remove_cards()
	create_cards(current_upgrades)
