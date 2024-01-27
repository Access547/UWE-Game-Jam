extends StaticBody2D

@export var isLeft: bool

@onready var aniP = $AnimationPlayer
@onready var area2DCS = $Area2D/CollisionShape2D




func _on_area_2d_area_entered(area):
	if area.is_in_group("Kick"):
		area2DCS.queue_free()
		if isLeft:
			aniP.play("Open left")
		else:
			aniP.play("Open right")
	
	
