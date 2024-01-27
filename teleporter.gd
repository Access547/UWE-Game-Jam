extends Area2D
@export var player:CharacterBody2D
@export var teleLocation:Vector2

func _on_area_entered(area):
	player.position = teleLocation


func _on_body_entered(body):
	player.position = teleLocation
