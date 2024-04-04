extends Node2D

var level = 1
var knockback_amount = 100
var attack_size = 1.0
var target = Vector2.ZERO # Global position of target
var direction = Vector2.ZERO
var speed = 100
var pierce_amount : int = 1

func _ready():
	$DestroyTimer.start()
	rotation = direction.angle()


func _physics_process(delta):
	position += direction * speed * delta


func _on_destroy_timer_timeout():
	queue_free()


func set_damage(val : float): # Override from Projectile
	$DamageBox.damage = val
	
func set_attack_speed(val : float):
	$DamageBox.attack_speed = val


func _on_damage_box_area_entered(_area):
	pierce_amount -= 1
	if pierce_amount <= 0: queue_free()
