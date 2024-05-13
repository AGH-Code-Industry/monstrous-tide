extends Weapon

@export var lightning_scene: PackedScene


func _ready():
	super()


func _on_cuntdown_timer_timeout():
	var current_lightning
	var enemies_chain = []
	#if len(get_tree().get_nodes_in_group("enemy")) < charges:
		#charges = len(get_tree().get_nodes_in_group("enemy"))
	for i in range(stat_set.get_stat_value(Stat.Type.MULTISHOT)):
		var start_character
		if !current_lightning:
			start_character = get_parent().get_parent()
		else:
			start_character = current_lightning.end_character
		enemies_chain.append(start_character)
		print(stat_set.get_stat_value(Stat.Type.DAMAGE))
		var lightning_instance = Lightning.new_lightning(stat_set.get_stat_value(Stat.Type.DAMAGE),
		start_character, enemies_chain)
		current_lightning = lightning_instance
		add_child(lightning_instance)
		await get_tree().create_timer(.05).timeout
