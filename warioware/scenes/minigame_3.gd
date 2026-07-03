extends Node2D

var item_scene = preload("res://scenes/falling_rock.tscn")
@onready var themed_timer = $ThemedTimer
var timer_end = false # boolean (true or false) stating whether the timer ended



# Called when the node enters the scene tree for the first time.
func _ready():
	await themed_timer.Timer(10.0) #accessing a function from this node
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




func _on_timer_timeout():
	var new_item = item_scene.instantiate()
	
	if new_item.has_signal("hit_rock"):
		new_item.hit_rock.connect(_on_falling_rock_hit_rock)
	
	var rando_x = randi_range(90,1070)
	new_item.position = Vector2(rando_x,-50)
	
	add_child(new_item)


func _on_falling_rock_hit_rock():
	Global.minigames_done -=1
	Global.lives -=1
	$WarioWAH.play()
	get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
