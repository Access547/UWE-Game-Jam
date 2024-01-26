extends Node

var input = Vector2.ZERO

const max_speed = 400
const accel = 1500
const friction = 600


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
func player_movement():
	input = get_input()
	
	if velocity.length() > (friction * delta):
		velocity -= velocity.normalized() * (friction * delta)
