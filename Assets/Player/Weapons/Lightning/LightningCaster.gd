extends Weapon

@export var lightning_scene: PackedScene
var charges = 3


func _on_cuntdown_timer_timeout():
	var current_lightning
	var enemies_chain = []
	#if len(get_tree().get_nodes_in_group("enemy")) < charges:
		#charges = len(get_tree().get_nodes_in_group("enemy"))
	for i in range(charges):
		var lightning_instance = lightning_scene.instantiate()
		if !current_lightning:
			lightning_instance.start_character = get_parent().get_parent()
			current_lightning = lightning_instance
		else:
			lightning_instance.start_character = current_lightning.end_character
			current_lightning = lightning_instance
		enemies_chain.append(lightning_instance.start_character)
		lightning_instance.enemies_chain = enemies_chain
		get_parent().get_parent().get_parent().add_child(lightning_instance)
