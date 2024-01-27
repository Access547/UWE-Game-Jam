extends Camera2D


#Quick camera shake I stole from the fisher which I stole from a YouTube vid 
#https://www.youtube.com/watch?v=LGt-jjVf-ZU <<<< The video
#Increase the shake strength to increase intensity
#Increase shake fade to DECREASE time takes to fade
#To call this from other scripts, use >>>> get_tree().get_first_node_in_group("Camera").ApplyShake()
#Honestly I should change this to take in parameters for strength and fade 

@export var randomStrength: float = 30.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0


func ApplyShake():
	shake_strength = randomStrength
	

func _process(delta):
	
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength,0,shakeFade * delta)
		
		offset = RandomOffset()
		
func RandomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength), rng.randf_range(-shake_strength,shake_strength))
