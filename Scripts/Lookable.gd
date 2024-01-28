extends Area2D


@onready var sprite = $Sprite2D
@onready var anim = $AnimationPlayer


@export var canvas: CanvasLayer
@export var tRect: TextureRect

func _ready():
	pass
	
func _process(_delta):
	if NumberManager.brownedOut == true:
		if tRect:
			tRect.queue_free()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		anim.play("In")


func _on_body_exited(body):
	if body.is_in_group("Player"):
		anim.play("Out")
