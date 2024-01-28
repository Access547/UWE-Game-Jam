extends Area2D


@onready var audio = $AudioStreamPlayer2D
@onready var sBody = $StaticBody2D
@onready var colShape = $CollisionShape2D
@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D
@export var sceene:PackedScene


func _on_area_entered(area):
	if area.get_collision_layer() == 8:
		var instance = sceene.instantiate()
		get_tree().root.add_child(instance)
		instance.position = position
		instance.emitting = true
		
		get_tree().get_first_node_in_group("Camera").ApplyShake()
		audio.pitch_scale = randf_range(0.9, 1.2)
		audio.play()
		visible = false
		set_collision_mask_value(4, false)
		sBody.set_collision_layer_value(6, false)
		


func _on_audio_stream_player_2d_finished():
	queue_free()
