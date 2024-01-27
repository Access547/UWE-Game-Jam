extends StaticBody2D

var playerIn = false
var toilettimeHere = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playerIn == true and Input.is_action_just_pressed("shit"):
		toiletTime()
	


func _on_area_2d_body_entered(body):
	playerIn = true


func _on_area_2d_body_exited(body):
	playerIn = false
	
func toiletTime():
	toilettimeHere = true
