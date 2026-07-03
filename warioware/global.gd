extends Node

var minigames_done = 0
var lives = 5

var is_muted: bool = false
var is_fullscreen: bool = false

func _process(delta):
	if lives == 0:
		lives = 5
		get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")
		
