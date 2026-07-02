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
	
	if timer_end: # if the timer does end...
		Global.minigames_done +=1 #go back a minigame
		get_tree().change_scene_to_file("res://scenes/done_screen.tscn") # back to intermission



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
	get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
