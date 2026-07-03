extends Node2D

@onready var self_area = $Area2D

@onready var player_area = $"../Player/Area2D"

@export var fall_speed = 400

signal hit_rock

func _process(delta):
	position.y += fall_speed * delta
	
	if position.y > 550:
		queue_free()

	if player_area.overlaps_area(self_area): # checks if overlapping
		if self.visible:
			emit_signal("hit_rock") #signal broadcast
			
			
