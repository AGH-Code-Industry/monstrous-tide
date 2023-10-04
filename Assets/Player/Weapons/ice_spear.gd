extends Area2D

var level = 1
var hp = 1
@export var speed = 100
@export var damage = 5
@export var knockback_amount = 100
var attack_size = 1.0

var target = Vector2.ZERO
var angle = Vector2.ZERO

#@onready var player = get_tree().get_first_node_in_group("Player")

func _ready():
	$DestroyTimer.start()
	angle = global_position.direction_to(target)
	rotation = angle.angle() + deg_to_rad(135)
	
	
func _physics_process(delta):
	position += angle * speed * delta

func enemy_hit(area : Area2D, charge = 1):
	deal_damage(area)
	hp -= charge
	if hp <= 0:
		queue_free()


func _on_destroy_timer_timeout():
	queue_free()


func _on_area_entered(area):
	if area.has_method("take_damage"):
		enemy_hit(area)
		
		
func deal_damage(area: Area2D) -> void:
	# All the calculations for %increased damage etc happens here
	var dmg: Damage = Damage.new()
	dmg.damage = damage
	
	area.take_damage(dmg)
