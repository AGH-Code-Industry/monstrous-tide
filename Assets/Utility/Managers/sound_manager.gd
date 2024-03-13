extends Node2D

@onready var card_pickup_sound = $CardPickupSound
@onready var soundtrack = $Soundtrack
@onready var game_over_sound = $GameOverSound
@onready var enemy_death_sound = $EnemyDeathSound
@onready var player_hit_sound = $PlayerHitSound

func _ready() -> void:
	play_soundtrack()

func play_card_pickup_sound():
	card_pickup_sound.stop()
	card_pickup_sound.play()

func play_soundtrack():
	soundtrack.stop()
	soundtrack.play()
	
func stop_soundtrack():
	soundtrack.stop()
	
func play_game_over_sound():
	game_over_sound.stop()
	game_over_sound.play()
	
func play_enemy_death_sound():
	enemy_death_sound.stop()
	enemy_death_sound.play()

func play_player_hit_sound():
	player_hit_sound.stop()
	player_hit_sound.play()
