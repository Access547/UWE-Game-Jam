extends StaticBody2D

@onready var aniP = $AnimationPlayer

@onready var colLeft = $Left/CollisionShape2D
@onready var colRight = $Right/CollisionShape2D
@onready var audio = $AudioStreamPlayer2D

var opened = false

func _on_left_area_entered(area):
	OpenDoor("Open left", area)


func _on_right_area_entered(area):
	OpenDoor("Open right", area)


func OpenDoor(animation: String, area: Area2D):
	if area.is_in_group("Kick"):
		aniP.play(animation)
		colLeft.queue_free()
		colRight.queue_free()
		get_tree().get_first_node_in_group("Camera").ApplyShake()
		audio.pitch_scale = randf_range(0.9, 1.2)
		audio.play()
		opened = true
		set_collision_layer_value(2, false)
