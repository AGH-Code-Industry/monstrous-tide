extends Node2D

# Properties
var radius = 50  # Radius of the circular path
var speed = 1     # Speed of rotation

# Variables
var angle = 0     # Current angle

func _process(delta):
	# Update angle based on speed and delta time
	angle += speed * delta
	
	# Calculate new position based on angle
	var x = radius * cos(angle)
	var y = radius * sin(angle)
	
	# Set the position of the object
	position = Vector2(x, y)
