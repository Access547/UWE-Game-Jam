extends Area2D

@export var car:StaticBody2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_body_entered(body):
	car.position = $Marker2D.get_global_position()
	print("enter1")


func _on_area_entered(area):
	car.position = $Marker2D.get_global_position()
	print("enter2")
