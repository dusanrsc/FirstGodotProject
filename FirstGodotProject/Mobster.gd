extends Area2D

# Node settings
# Variable section
var mobster_speed = 200

# Node mechanism
func _ready():
	# Spawn mobster position
	self.position.x = randi_range(30, (get_viewport().size.x - 30))
	self.position.y = -10

# Main node function
func _process(delta):
	# Mobster movement by y axis
	self.position.y += mobster_speed * delta

	# If mobster position is out of the screen deltete it
	if self.position.y > (get_viewport().size.y + 50):
		self.queue_free()
		
		# Player health decrement
		GameState.player_health -= 1
		
		# Restircting player health decrement if is zeor
		if GameState.player_health <= 0:
			GameState.player_health = 0

# Collision function
func _on_area_entered(area):
	self.queue_free()
	
	# Increase game score
	GameState.score += 100
