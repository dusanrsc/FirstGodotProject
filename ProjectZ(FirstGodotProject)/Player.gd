extends Node2D

# Node settings
# Variable section
@export var laser_tscn: PackedScene
@export var game_over_tscn: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	# Mechanism for hidding mouse cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# get mouse global mouse position
	# Set player x position as mouse x position 
	var mouse_pos = get_global_mouse_position()
	self.position.x = mouse_pos.x
	
	# On fire spawn lasers	
	if Input.is_action_pressed("fire"):
		# Creating instance of laser scene
		var new_laser = laser_tscn.instantiate()
		add_sibling(new_laser)

		# Setting up laser spawn position as player position
		new_laser.position = self.position
		new_laser.position.y = (self.position.y - 55)
		
		# Restrict players laser get out of the screen by x axis
		if new_laser.position.x <= 30:
			new_laser.position.x = 30
		elif new_laser.position.x >= (get_viewport().size.x - 30):
			new_laser.position.x = (get_viewport().size.x - 30)

	# Set player dynamic position on the screen by y axis
	self.position.y = (get_viewport().size.y - 30)
	
	# Restrict player get out of the screen by x axis
	if self.position.x <= 30:
		self.position.x = 30
	elif self.position.x >= (get_viewport().size.x - 30):
		self.position.x = (get_viewport().size.x - 30)
		
	# If player health is smaller than one delete player and game over 
	if GameState.player_health < 1:
		self.queue_free()
		
		# Display game over label
		var new_game_over = game_over_tscn.instantiate()
		add_sibling(new_game_over)

# Player collision
func _on_area_entered(area):
	# If mobster hits player player healths decrement by one
	GameState.player_health -= 1
