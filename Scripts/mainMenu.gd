extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_select_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")


func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/howToPlay.tscn")


func _on_exit_pressed():
	get_tree().quit()