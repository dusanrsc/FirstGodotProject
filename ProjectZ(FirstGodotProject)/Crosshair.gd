extends Node2D

# Node settings
var mouse_pos = null
var rotation_speed = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Coloring Node by code
	self.modulate = Color(1, 1, 1, 1)
		
	# Crosshair position follows mouse position
	mouse_pos = get_global_mouse_position()
	self.position = mouse_pos
	
	# Crosshair rotation mechanism
	self.rotation -= rotation_speed * delta
	
	# Restrict crosshair get out of the screen
	# For x axis
	if self.position.x <= 30:
		self.position.x = 30
	elif self.position.x >= (get_viewport().size.x - 30):
		self.position.x = (get_viewport().size.x - 30)
	
	# For y axis	
	if self.position.y <= 30:
		self.position.y = 30
	elif self.position.y >= (get_viewport().size.y - 80):
		self.position.y = (get_viewport().size.y - 80)
