extends CharacterBody2D

const SPEED: int = 150
var ball: CharacterBody2D

func _process(_delta: float) -> void:
	
	ball = Global.ball_node
	if ball and ball.velocity.x > 0:
		var predicted_y = _predict_ball(ball)
		velocity.y = signi(int(predicted_y - position.y)) * SPEED
	else:
		velocity.y = sign(180 - position.y) * SPEED
	move_and_slide()

func _predict_ball(ball_a: CharacterBody2D) -> int:
	
	var simulated_position: Vector2 = ball_a.position
	var simulated_velocity: Vector2 = ball_a.velocity
	
	# simulate ball's trajectory until reaches paddle
	while simulated_position.x < 600 and simulated_velocity.x != 0:
		simulated_position += simulated_velocity * get_process_delta_time()
		
		# simulate bouncing off of walls
		if simulated_position.y < 15 or simulated_position.y > 625:
			simulated_velocity.y *= -1
	
	return int(simulated_position.y)
