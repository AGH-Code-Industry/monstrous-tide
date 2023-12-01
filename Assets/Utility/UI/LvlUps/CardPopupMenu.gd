extends CanvasLayer

@onready var h_box_container = $MarginContainer/HBoxContainer
var level_up_card = preload("res://Assets/Utility/UI/LvlUps/LvlUpCard.tscn")
var WeaponManager: Node


func create_cards():
	if WeaponManager == null:
		return
	WeaponManager.get_randomly_chosen_upgrades(3)
	for i in range(3):
		var level_up_card_instance = level_up_card.instantiate()
		h_box_container.add_child(level_up_card_instance)
		
		
func remove_cards():
	for card in h_box_container.get_children():
		card.queue_free()


func level_up(levels_to_lvlup: int):
	if len(h_box_container.get_children()) > 0:
		await GameEvents.upgrade_selected
	for i in levels_to_lvlup:
		get_tree().paused = true
		create_cards()
		await GameEvents.upgrade_selected
		remove_cards()
		get_tree().paused = false
