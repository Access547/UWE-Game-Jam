extends CharacterBody2D
var input = Vector2.ZERO

@export var max_speed = 400
@export var accel = 1500
@export var friction = 600
@export var goopspeed = 100
var currentMax
var mouse_pos
var youwin
@export var time: float
@export var toilet:StaticBody2D
@export var level: String

@onready var ttp = $ttp


func _ready():
	StartTTP(time)

func _physics_process(delta):
	if NumberManager.canMove:
		if toilet.toilettimeHere == false:
			player_movement(delta)
		look_at_mouse()
		
		if Input.is_action_just_pressed("kick"):
			kick()
		if toilet.toilettimeHere == true:
			youWin()
	
	
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


func _on_interact_area_area_entered(area):
	if area.get_collision_layer() == 16:
		currentMax = max_speed
		max_speed = goopspeed


func _on_interact_area_area_exited(area):
	if area.get_collision_layer() == 16:
		max_speed = currentMax
	
	
func youWin():
	$HUD/youWin.visible = true
	$"HUD/Next Level".visible = true
	
	
	ttp.stop()
	$HUD/Control/ProgressBar.visible = false

func youLose():
	$HUD/youLose.visible = true
	NumberManager.canMove = false
	$Sprite2D.set_texture(preload("res://Assets/Art/Player fallen.png"))
	$Poop.visible = true
	
	if get_node_or_null("HUD/Dialog"):
		$HUD/Dialog.EndDialog()


func _on_ttp_timeout():
	youLose()
	
	
func StartTTP(time):
	ttp.start(time)




func _on_replay_pressed():
	get_tree().change_scene_to_file(level)


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
