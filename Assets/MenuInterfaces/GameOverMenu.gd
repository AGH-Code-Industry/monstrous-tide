extends CanvasLayer

func _ready():
	SoundManager.stop_soundtrack()
	SoundManager.play_game_over_sound()
	get_tree().paused = true
	

func _on_restart_pressed():
	# TODO find more elegant way to fix it
	SoundManager.game_over_sound.stop()
	SoundManager.play_soundtrack()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Assets/World/world.tscn")


func _on_exit_button_pressed():
	get_tree().quit()

