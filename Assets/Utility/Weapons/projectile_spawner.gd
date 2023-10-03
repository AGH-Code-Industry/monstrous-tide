extends Node2D

@export var timeBetweenAttacks = 1.0
var IceSpear = preload("res://Assets/Player/Weapons/ice_spear.tscn")
var Tornado = preload("res://Assets/Player/Weapons/tornado.tscn")

var enemiesClose = []
@onready var player = get_tree().get_first_node_in_group("player")


func _on_ice_spear_timer_timeout():
	var newSpear = IceSpear.instantiate()
	newSpear.position = position
	newSpear.target = get_random_target()
	add_child(newSpear) # TODO change this, now projectiles use local space of player

func _on_tornado_timer_timeout():
	var newTornado = Tornado.instantiate()
	newTornado.position = position
	newTornado.last_movement = player.last_movement
	add_child(newTornado)



func _on_detection_circle_body_entered(body):
	if not enemiesClose.has(body):
		enemiesClose.append(body)


func _on_detection_circle_body_exited(body):
	if enemiesClose.has(body):
		enemiesClose.erase(body)
		
func get_random_target():
	if enemiesClose.size() > 0:
		return enemiesClose.pick_random().global_position
	else:
		return Vector2.UP


