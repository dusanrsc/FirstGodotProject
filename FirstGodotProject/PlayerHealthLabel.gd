extends Label

func _process(delta):
	self.text = (str(GameState.player_health) + "X")
