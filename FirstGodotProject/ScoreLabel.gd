extends Label

func  _process(delta):
	self.text = ("XP: " + str(GameState.score))
