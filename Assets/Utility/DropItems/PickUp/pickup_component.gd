extends Node2D


@onready var pickup_circle = $pickupRadius
@export var stats = {"pickupRadius" : 5}


func set_radius(radius: float):
	pickup_circle.shape.radius = radius
	

func _on_pickup_radius_area_entered(area: Area2D) -> void:
	if area.has_method("pickUp"):
		area.pickUp(position)



func _on_reaction_radius_area_entered(area: Area2D) -> void:
	if area.has_method("collect"):
		area.collect()
