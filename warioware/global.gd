extends Node

var minigames_done = 0
var lives = 5

func _process(delta):
	if lives <= 0:
		get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")
		
