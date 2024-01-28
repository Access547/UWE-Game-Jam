extends TextureButton

@export var level: String
@export var texture: Texture2D
@export var levelName: String
@onready var label = $Label



func _ready():
	set_texture_normal(texture)
	label.set_text(levelName)

func _on_pressed():
	get_tree().change_scene_to_file(level)

func _on_mouse_entered():
	label.visible = !label.visible


func _on_mouse_exited():
	label.visible = !label.visible
