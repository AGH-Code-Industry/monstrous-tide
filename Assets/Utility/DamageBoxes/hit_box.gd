extends Area2D

# For taking damage

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var disableTimer: Timer = $DisableTimer

@export var max_health : float = 10
@export var health: float = 10
@export var show_damage_taken_numbers: bool = false
@export var show_heal_numbers: bool = false

# Hit indicators
@onready var bleed_particles = $BleedParticles
@export var flash_on_hit : bool
@export var sprite : CanvasItem
@export var flash_timeout : float
@export var flash_color : Color

signal update_health

signal on_death()

func _ready():
	health = max_health

func take_damage(dmg: Damage) -> void:
	# Use stats like defense/dodge to reduce/mitigate damage taken
	var calculated_damage = dmg.damage

	health -= calculated_damage

	if(show_damage_taken_numbers):
		var text_type = FloatingTextSpawner.text_types.CRITICAL if dmg.is_critical_hit else FloatingTextSpawner.text_types.DAMAGE
		FloatingTextSpawner.create_floating_text(self, str(calculated_damage), text_type)

	if(not dmg.bypass_invulnerability):
		collision.call_deferred("set", "disabled", true)
		disableTimer.start()
	if health <= 0:
		die()
	update_health.emit()
	
	if(flash_on_hit):
		sprite.modulate = flash_color
		bleed_particles.emitting = true
		await get_tree().create_timer(flash_timeout).timeout
		bleed_particles.emitting = false
		sprite.modulate = Color(1,1,1)

func heal(heal_amount : float) -> void:
	var calculated_healing = heal_amount # Modifiers here
	health = min(health + calculated_healing, max_health) 
	if show_heal_numbers:
		FloatingTextSpawner.create_floating_text(self, str(heal_amount), FloatingTextSpawner.text_types.HEALING)
	
	update_health.emit()

func die() -> void:
	on_death.emit()

func _on_disable_timer_timeout() -> void:
	collision.call_deferred("set", "disabled", false)
