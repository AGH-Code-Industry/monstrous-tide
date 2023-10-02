extends Area2D

# For taking damage

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var disableTimer: Timer = $DisableTimer

@export var health: float = 10

signal on_death()

func take_damage(dmg: Damage) -> void:
	# Use stats like defense/dodge to reduce/mitigate damage taken
	health -= dmg.damage
	print(get_parent().get_name(), ": ", health)
	if(not dmg.bypass_invulnerability):
		collision.call_deferred("set", "disabled", true)
		disableTimer.start()
	if health <= 0:
		die()
		
func die() -> void:
	on_death.emit()

func _on_disable_timer_timeout() -> void:
	collision.call_deferred("set", "disabled", false)
