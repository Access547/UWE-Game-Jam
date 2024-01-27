extends TextureRect

@export var dialog = []
@export var textSpeed: float = 0.05

@onready var text = $Text
@onready var timer = $Timer
@onready var textAnim = $AnimationPlayer

var currentText = 0
var canProgress = false

func _ready():
	text.text = dialog[currentText]


func _process(delta):
	text.visible_ratio = ((timer.wait_time - (timer.time_left)) / timer.wait_time)
	
	if Input.is_action_just_pressed("kick") and canProgress == true:
		currentText += 1
		UpdateText()
	
	
func UpdateText():
	canProgress = false
	if currentText <= dialog.size() - 1:
		text.text = dialog[currentText]
		timer.start(2)
		
	else:
		textAnim.play("Fade out")
		if textAnim.current_animation == "Fade out" and text.self_modulate.a == 0:
			queue_free()


func _on_timer_timeout():
	canProgress = true
