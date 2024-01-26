extends Node2D
class_name Level


@onready var ttp = $TTP




func _on_ttp_timeout():
	print("You shit yourself!")



func StartTTP(time):
	ttp.start(time)
