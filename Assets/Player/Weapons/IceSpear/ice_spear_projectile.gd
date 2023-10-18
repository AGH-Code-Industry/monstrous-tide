extends Projectile

var level = 1
var knockback_amount = 100
var attack_size = 1.0
var target = Vector2.ZERO # Global position of target
var direction = Vector2.ZERO
#@onready var player = get_tree().get_first_node_in_group("Player")
var speed = 100
var pierce_amount : int = 1

func _ready():
	$DestroyTimer.start()
	rotation = direction.angle()


func _physics_process(delta):
	position += direction * speed * delta


func _on_destroy_timer_timeout():
	queue_free()


# Call this when instantiating a projectile
func config(dmg : float, spd : float, dir : Vector2, atkspd: float, prc : int, knbk : float):
	set_damage(dmg)
	speed = spd
	direction = dir
	set_attack_speed(atkspd)
	pierce_amount = prc
	knockback_amount = knbk


func set_damage(val : float): # Override from Projectile
	$DamageBox.damage = val
	
func set_attack_speed(val : float):
	$DamageBox.attack_speed = val


func _on_damage_box_area_entered(_area):
	pierce_amount -= 1
	if pierce_amount <= 0: queue_free()
