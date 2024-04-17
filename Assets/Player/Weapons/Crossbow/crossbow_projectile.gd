extends Node2D

@export var speed = 50
var direction
var pierce_amount = 1

func initialization(dmg, size, dir, prc, weapon_name):
	$DamageBox.damage = dmg
	self.scale = Vector2(size, size)
	direction = dir - global_position
	rotation = direction.angle()
	pierce_amount = prc
	$DamageBox.weapon_name = weapon_name

func _physics_process(delta):
	position += direction.normalized() * speed * delta

func lifetime():
	await get_tree().create_timer(10).timeout
	queue_free()

func _on_damage_box_area_entered(area):
	pierce_amount -= 1
	if pierce_amount == 0:
		queue_free()
