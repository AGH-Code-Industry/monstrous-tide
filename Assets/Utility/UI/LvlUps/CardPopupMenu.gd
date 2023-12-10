extends CanvasLayer

@onready var h_box_container = $MarginContainer/HBoxContainer
@export var cards_to_draw_count = 4
var level_up_card = preload("res://Assets/Utility/UI/LvlUps/LvlUpCard.tscn")
var WeaponManager: Node
var current_upgrades


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
		
		h_box_container.add_child(level_up_card_instance)
		
		
func remove_cards():
	for card in h_box_container.get_children():
		card.queue_free()
	if len(WeaponManager.get_all_upgrades()) - len(current_upgrades) <= 0:
		$MarginContainer/Button.disabled = true
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


func _on_button_pressed():
	var upgrades_left_count = len(WeaponManager.get_all_upgrades()) - len(current_upgrades)
	if !(upgrades_left_count > len(current_upgrades)):
		while (len(current_upgrades) - upgrades_left_count):
			current_upgrades.remove_at(len(current_upgrades)-1)
	remove_cards()
	create_cards(current_upgrades)
