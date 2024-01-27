extends Area2D

@export var dialog: PackedScene
@export var canvas: CanvasLayer

func _on_body_entered(body):
	if body.is_in_group("Player"):
		var textbox = dialog.instantiate()
		textbox.dialog[0] = "Hi son!"
		textbox.dialog[1] = "Wow you look like you're in a rush!"
		textbox.dialog[2] = "I won't take up anymore of your precious time!"
		canvas.add_child(textbox)
		
		queue_free()
