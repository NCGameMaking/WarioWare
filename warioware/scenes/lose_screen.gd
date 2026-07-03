extends Control


func _on_menu_button_pressed():
	Global.minigames_done = 0
	Global.lives = 5
	get_tree().change_scene_to_file("res://title_slide.tscn")


func _on_quit_button_pressed():
	print("Quit button was clicked!")
	get_tree().quit()
