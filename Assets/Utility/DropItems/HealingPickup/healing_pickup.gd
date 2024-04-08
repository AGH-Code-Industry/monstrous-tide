extends DropItemClass

@export var healing_amount : float = 5

func collect():
	get_tree().get_first_node_in_group("player").get_child(3).heal(healing_amount)
	#%Player/HitBox.heal(healing_amount)
