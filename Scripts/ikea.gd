extends Node2D

var code: String
@onready var label = $"Character/HUD/Sticky Note/Label"

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 4:
		var digit = str(randi_range(0,9))
		code = code + digit
	
	label.set_text(code)
	

