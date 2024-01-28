extends TextureRect


var currentCode = ""
@onready var label = $Label

func _ready():
	label.set_text(currentCode)

func _on_button_pressed():
	PressNum("1")


func _on_button_2_pressed():
	PressNum("2")


func _on_button_3_pressed():
	PressNum("3")


func _on_button_4_pressed():
	PressNum("4")


func _on_button_5_pressed():
	PressNum("5")


func _on_button_6_pressed():
	PressNum("6")


func _on_button_7_pressed():
	PressNum("7")


func _on_button_8_pressed():
	PressNum("8")


func _on_button_9_pressed():
	PressNum("9")


func _on_button_10_pressed():
	PressNum("0")

func PressNum(num):
	currentCode = currentCode + num
	label.set_text(currentCode)


func _on_button_11_pressed():
	if currentCode == get_parent().get_parent().get_parent().code:
		print("yay!")
