extends Node2D

# Properties
var radius = 0  # Radius of the circular path
@export var speed = 5  # Speed of rotation

# Variables
var angle = 0  # Current angle

func _process(delta):
	# Update angle based on speed and delta time
	angle += speed * delta
	# Calculate new position based on angle
	var x = radius * cos(angle)
	var y = radius * sin(angle)
	
	# Set the position of the object
	position = Vector2(x, y)

func initialization(size, damage, angle, radius):
	self.scale = Vector2(size, size)
	$DamageBox.damage = damage
	self.angle = angle
	self.radius = radius
