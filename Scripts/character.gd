extends CharacterBody2D
var input = Vector2.ZERO

@export var max_speed = 400
@export var accel = 1500
@export var friction = 600
var mouse_pos



func _physics_process(delta):
	player_movement(delta)
	look_at_mouse()
	
	if Input.is_action_just_pressed("kick"):
		kick()
	
	
func get_input():
	input.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	input.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return input.normalized()
	
func player_movement(delta):
	input = get_input()
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
	move_and_slide()
	look_at_mouse()
	
func look_at_mouse():
	var direction = get_global_mouse_position() - position
	look_at(get_global_mouse_position())
	
func kick():
	$kickbox/CollisionShape2D.disabled = false
	#ADD ANIMATION LOGIC HERE
	#play kick animation
	#when kick animation is done disable kickbox again
	$"Kick Timer".start()




func _on_kick_timer_timeout():
	$kickbox/CollisionShape2D.disabled = true
