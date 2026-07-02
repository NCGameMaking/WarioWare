extends Node2D


@onready var lava_area = $LavaArea
@export var rise_speed = 40

signal hit_lava
# Called when the node enters the scene tree for the first time.
func _ready():
	lava_area.area_entered.connect(_on_lava_area_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= rise_speed * delta
	rise_speed += 15 * delta


func _on_lava_area_area_entered(area):
	emit_signal("hit_lava")
