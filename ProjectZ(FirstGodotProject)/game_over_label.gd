extends Label

func _process(delta):
	# Render 'GAME OVER!' label at the center of the screen.
	self.text = "GAME OVER!"
	self.position.x = ((get_viewport().size.x - self.get_size().x) / 2)
	self.position.y = ((get_viewport().size.y - self.get_size().y) / 2)
	
	# If game is over and user press enter reload the game
	if Input.is_action_just_pressed("ui_accept"):
		GameState.reset_values()
		get_tree().reload_current_scene()
	
	# If game is over and user press escape quit the game
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
