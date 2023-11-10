extends Node2D


@onready var pickup_circle = $pickupRadius/CollisionShape2D
@export var stats = {StatConstants.PlayerStats.PICKUPRADIUS : 53}


func _ready():
	StatManager.update_player_stats_misc.connect(on_pickupradius_update)
	pickup_circle.shape.radius = stats[StatConstants.PlayerStats.PICKUPRADIUS]

func set_radius(radius: float):
	pickup_circle.shape.radius = radius
	

func _on_pickup_radius_area_entered(area: Area2D) -> void:
	var parent = area.get_parent()
	if parent.has_method("pickUp"):
		parent.pickUp(self)



func _on_reaction_radius_area_entered(area: Area2D) -> void:
	var parent = area.get_parent()
	if parent.has_method("collect"):
		parent.collect()


func on_pickupradius_update(new_stats):
	stats = StatManager.add_relevant_stats(stats, new_stats)
	pickup_circle.shape.radius = stats[StatConstants.PlayerStats.PICKUPRADIUS]
	
