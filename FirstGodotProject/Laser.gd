extends Node2D

var laser_speed = 1000

func _process(delta):
	# Laser trajectory mechanism
	self.position.y -= laser_speed * delta
	
	# If laser y position is smaller than 0 than delete
	if self.position.y <= 0:
		self.queue_free()
