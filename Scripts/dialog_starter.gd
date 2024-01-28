extends Area2D

@export var dialog: PackedScene
@export var canvas: CanvasLayer
@export var text: Array[String] = []


func _on_body_entered(body):
	if body.is_in_group("Player"):
		var textbox = dialog.instantiate()
		for i in text.size():
			textbox.dialog.append(text[i])
		canvas.add_child(textbox)
		
		queue_free()
