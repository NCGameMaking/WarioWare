extends Node2D




func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://title_slide.tscn")
	Global.minigames_done = 0
	Global.lives = 5


func _on_quit_button_pressed():
	get_tree().quit()
