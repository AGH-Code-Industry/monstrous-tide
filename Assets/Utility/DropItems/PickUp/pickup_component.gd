extends Node2D


@onready var pickup_circle = $pickupRadius/CollisionShape2D
@export var stat_set: StatSet


func _ready():
	StatManager.update_player_stats_misc.connect(on_pickupradius_update)
	pickup_circle.shape.radius = stat_set.get_stat_value(Stat.Type.PICKUPRADIUS)

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


func on_pickupradius_update(new_stats: Array[Stat]):
	stat_set.add_stat_array(new_stats)
	pickup_circle.shape.radius = stat_set.get_stat_value(Stat.Type.PICKUPRADIUS)
	
