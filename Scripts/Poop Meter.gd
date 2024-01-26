extends ProgressBar

@onready var ttp = $"../../../../ttp"






func _process(_delta):
	value = ((ttp.wait_time - (ttp.time_left)) / ttp.wait_time) * 100 #Gets time remaining as a %
	NumberManager.poopTimer = ttp.time_left #Grabs a ref for time left and stores it globally to make for easier referencing
