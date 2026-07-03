extends Control

@onready var mute_button = $Panel/VBoxContainer/MuteButton
@onready var fullscreen_button = $Panel/VBoxContainer/FullscreenButton

# Called when the node enters the scene tree for the first time.
func _ready():
	mute_button.button_pressed = Global.is_muted
	fullscreen_button.button_pressed = Global.is_fullscreen
	
	mute_button.toggled.connect(_on_mute_toggled)
	fullscreen_button.toggled.connect(_on_fullscreen_toggled)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mute_toggled(toggled_on : bool):
	Global.is_muted = toggled_on
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), toggled_on)

func _on_fullscreen_toggled(toggled_on : bool):
	Global.is_fullscreen = toggled_on
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else :
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://title_slide.tscn")
