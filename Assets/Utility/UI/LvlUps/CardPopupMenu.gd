extends CanvasLayer

@onready var h_box_container = $MarginContainer/HBoxContainer
var level_up_card = preload("res://Assets/Utility/UI/LvlUps/LvlUpCard.tscn")
var WeaponManager: Node


func create_cards():
	if WeaponManager == null:
		return
	var all_upgrades = WeaponManager.get_randomly_chosen_upgrades(3)
	print(all_upgrades)
	for upgrade in all_upgrades:
		var level_up_card_instance = level_up_card.instantiate()
		level_up_card_instance.get_node("%Item Name").text = str(upgrade.name)
		print(typeof(upgrade))
		
		
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
