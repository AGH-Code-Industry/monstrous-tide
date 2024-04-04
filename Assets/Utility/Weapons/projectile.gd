## This resource holds all information required to instantiate a projectile.
class_name Projectile
extends Resource

## Damage per projectile
@export var damage : float

## The amount of times a projectile fires per second (1s / [param attack_speed])
@export var attack_speed : int

## Projectile's speed
@export var speed : int

## The amount of projectiles spawned per attack
@export var projectiles_per_attack : int

## Projectile's scene
@export var scene : PackedScene

