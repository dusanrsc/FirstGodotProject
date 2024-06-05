extends Sprite2D

var moving_speed = 25

func _process(delta):
	self.position.y += moving_speed * delta
	
	if self.position.y >= 4096:
		self.position.y = 0
