class_name Projectile
extends Area2D

@export var damage : int
@export var attack_speed : int

func set_damage(val):
	damage = val
	
func set_attack_speed(val):
	attack_speed = val
