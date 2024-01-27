extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.get_collision_layer() == 8:
		#do animation maybe? it may be funny to play the same explosion animation everytime we kick something
		queue_free()
		
