extends Node2D

# Properties
var radius : float = 0  # Radius of the circular path
@export var speed : float = 5  # Speed of rotation

# Variables
var angle : float = 0  # Current angle

func _process(delta):
	# Update angle based on speed and delta time
	angle += speed * delta
	# Set the position of the object
	position = Vector2(radius * cos(angle), radius * sin(angle))

func initialization(size, damage, angle, radius):
	self.scale = Vector2(size, size)
	$DamageBox.damage = damage
	self.angle = angle
	self.radius = radius
