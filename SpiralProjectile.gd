extends Node2D

@export var target_radius : float = 100
@export var rotate_angular_speed : float = 1.2 # Rot / sec
@export var centrifugal_speed : float = 20 # Prędkość odśrodkowa [m/s]
@export var comparison_buffer :float = 0.1
var start_pos : Vector2
var current_radius = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = global_position 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += rotate_angular_speed * delta
	if $ColorRect.position.x - target_radius < comparison_buffer: 
		current_radius += centrifugal_speed * delta
	elif $ColorRect.position.x - target_radius > comparison_buffer:
		current_radius -= centrifugal_speed * delta
	$ColorRect.position.x = current_radius
		
func get_current_radius(): return current_radius
