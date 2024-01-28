extends StaticBody2D

@onready var aniP = $AnimationPlayer


@onready var audio = $AudioStreamPlayer2D

var opened = false


func OpenDoor(animation: String):

	aniP.play(animation)
	get_tree().get_first_node_in_group("Camera").ApplyShake()
	audio.pitch_scale = randf_range(0.9, 1.2)
	audio.play()
	opened = true
	set_collision_layer_value(2, false)
