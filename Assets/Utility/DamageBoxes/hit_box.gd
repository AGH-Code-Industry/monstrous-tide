extends Area2D

# For taking damage

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var disableTimer: Timer = $DisableTimer

# Health, regenaration, etc
@export var max_health : float = 10
@export var health: float = 10
@export var show_damage_taken_numbers: bool = false
@export var show_heal_numbers: bool = false
@export var regenaration_rate : float = 2 ## How much health to regenerate [health / sec]
@export var regeneration_enabled : bool ## Whether or not to regenerate health. ***DO NOT TOGGLE MANUALLY DURING PLAY*** To toggle use `toggle_regenaration()` method!
@onready var tick_timer : Timer = $RegenarationTickTimer

# Hit indicators
@onready var bleed_particles = $BleedParticles
@export var flash_on_hit : bool
@export var sprite : CanvasItem
@export var flash_timeout : float
@export var flash_color : Color


signal update_health
signal regeneration_update ## Emitted when value of `regeneration_enabled` is changed via `toggle_regenaration()` or when `regenaration_rate` is changed
signal damage_taken

signal on_death()

func _ready():
	health = max_health
	set_regeneretion_rate(regenaration_rate)
	if regeneration_enabled:
		tick_timer.start()
	

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
	damage_taken.emit()
	
	if(flash_on_hit):
		sprite.modulate = flash_color
		bleed_particles.emitting = true
		await get_tree().create_timer(flash_timeout).timeout
		bleed_particles.emitting = false
		sprite.modulate = Color(1,1,1)

func heal(heal_amount : float) -> void:
	if health >= max_health:
		return

	var calculated_healing = heal_amount # Modifiers here
	
	if health + calculated_healing > max_health:
		calculated_healing = max_health - health
	health += calculated_healing

	if show_heal_numbers:
		FloatingTextSpawner.create_floating_text(self, str(calculated_healing), FloatingTextSpawner.text_types.HEALING)

	update_health.emit()

func die() -> void:
	on_death.emit()

func _on_disable_timer_timeout() -> void:
	collision.call_deferred("set", "disabled", false)

func set_regeneretion_rate(new_value : float):
	regenaration_rate = new_value
	tick_timer.set_wait_time(1.0 / regenaration_rate)
	regeneration_update.emit()

func toggle_regenaration():
	regeneration_enabled = not regeneration_enabled
	tick_timer.set_paused(not regeneration_enabled)
	regeneration_update.emit()
	

func _on_regeneration_tick_timer_timeout():
	heal(1)
