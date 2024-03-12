extends Node2D

@export var speed = 50
var direction

func initialization(dmg, size, dir):
	$DamageBox.damage = dmg
	self.scale = Vector2(size, size)
	direction = dir - global_position
	rotation = direction.angle()

func _physics_process(delta):
	position += direction.normalized() * speed * delta

func lifetime():
	await get_tree().create_timer(10).timeout
	queue_free()
