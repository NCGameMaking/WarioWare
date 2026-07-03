extends Node2D

@onready var timer = $Player/Camera2D/ThemedTimer
@onready var lava_node = $Lava
var timer_end = false # boolean (true or false) stating whether the timer ended

# Called when the node enters the scene tree for the first time.
func _ready():
	lava_node.hit_lava.connect(_on_wario_burned)
	
	
	await timer.Timer(10.0) #accessing a function from this node
	#after this is compeleted...
	timer_end = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if timer_end:
		Global.minigames_done +=1
		if Global.minigames_done > 5: # we access a global script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn") # go back to the intermission scene


func _on_wario_burned():
	Global.minigames_done -=1
	Global.lives -= 1
	$WARIOWAH.play()
	get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
