extends Node2D

func _on_play_button_pressed():
	$ButtonClick.play()
	get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")


func _on_setting_button_pressed():
	get_tree().change_scene_to_file("res://scenes/setting_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
