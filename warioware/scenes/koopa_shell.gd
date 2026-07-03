extends Node2D

@onready var shell_area = $Area2D

@export var speed = 300
var direction = 1

var min_x = 74
var max_x = 1080

signal hit_player

func _ready():
	#shell_area.area_entered.connect(_on_area_2d_area_entered)
	pass

func _process(delta):
	position.x += speed * direction * delta
	if position.x > max_x:
		position.x = max_x
		direction = -1
	elif position.x < min_x:
		position.x = min_x
		direction = 1

func _on_area_2d_area_entered(area):
	emit_signal("hit_player")
