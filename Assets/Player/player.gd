extends CharacterBody2D


var animation_sprite: AnimatedSprite2D
var movement_speed: float = 40.0

func _ready():
	animation_sprite = get_node("AnimatedSprite2D")
	animation_sprite.play("Idle")

func _physics_process(delta):
	movement()
	
	
func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov)
	
	if mov != Vector2.ZERO:
		animation_sprite.play("Walk")
		if mov[0] > 0:
			animation_sprite.flip_h = true
		elif mov[0] < 0:
			animation_sprite.flip_h = false
	else:
		animation_sprite.play("Idle")
	velocity = mov.normalized() * movement_speed
	move_and_slide()

func die():
	print("Player died")


func _on_hit_box_on_death() -> void:
	die()
