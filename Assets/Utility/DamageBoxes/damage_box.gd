extends Area2D

# For dealing damage


# Preferably to be moved in the future to some sort of stats node
@export var damage: float = 1
# Number of attacks per second
@export var attack_speed: float = 2
# knocback strength
var knocback: float = 0

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $AttackSpeedTimer

func deal_damage(area: Area2D) -> void:
	# All the calculations for %increased damage etc happens here
	var dmg: Damage = Damage.new()
	dmg.damage = damage
	dmg.knocback = knocback
	dmg.knocback_direction = global_position.direction_to(area.global_position)
	area.take_damage(dmg)
	start_attack_cooldown()


func start_attack_cooldown() -> void:
	timer.wait_time = 1 / attack_speed
	timer.start()
	collision.call_deferred("set", "disabled", true)


func _on_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		deal_damage(area)


func _on_attack_speed_timer_timeout() -> void:
	collision.call_deferred("set", "disabled", false)
