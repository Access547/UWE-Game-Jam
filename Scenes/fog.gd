extends Node2D


@export var doors: Array[StaticBody2D]

var polygon: Polygon2D
var discovered = false

func _ready():
	polygon = get_child(0)


func _process(_delta):
	if !discovered:
		for i in doors.size():
			if doors[i] != null:
				if doors[i].opened:
					discovered = true
				
	elif discovered:
		polygon.self_modulate.a -= 0.1
		
	if polygon.self_modulate.a <= 0:
		queue_free()
