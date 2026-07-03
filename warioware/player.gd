extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$WarioJump.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("rocks"):
		Global.minigames_done -=1
		Global.lives -=1
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
