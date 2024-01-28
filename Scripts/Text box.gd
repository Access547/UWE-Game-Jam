extends Control

@export var dialog = []
@export var textSpeed: float = 0.05


@onready var text = $"Text box/Text"
@onready var timer = $"Text box/Timer"
@onready var textAnim = $"Text box/AnimationPlayer"



var currentText = 0
var canProgress = false

func _ready():
	text.text = dialog[currentText]
	NumberManager.canMove = false


func _process(delta):
	text.visible_ratio = ((timer.wait_time - (timer.time_left)) / timer.wait_time)
	
	if Input.is_action_just_pressed("kick") and canProgress == true:
		currentText += 1
		UpdateText()
	
	
func UpdateText():
	canProgress = false
	if currentText <= dialog.size() -1:
		text.text = dialog[currentText]
		timer.start(2)
		
	else:
		textAnim.play("Fade out")




func _on_timer_timeout():
	canProgress = true


func EndDialog():
		NumberManager.canMove = true
		queue_free()
