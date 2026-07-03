extends Node2D

@onready var timer = $ThemedTimer
@onready var koopa_shell = $KoopaShell
@onready var koopa_shell_2 = $KoopaShell2

var timer_end = false
# Called when the node enters the scene tree for the first time.
func _ready():
	koopa_shell.hit_player.connect(_wario_shell_hit)
	koopa_shell_2.hit_player.connect(_wario_shell_hit)
	
	await timer.Timer(10.0) #accessing a function from this node
	timer_end = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer_end:
		if Global.minigames_done > 4: # we access a global script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn") # go back to the intermission scene

func _wario_shell_hit():
	Global.minigames_done -=1
	Global.lives -= 1
	$WARIOWAHH.play()
	get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
