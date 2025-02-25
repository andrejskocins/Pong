extends CharacterBody2D

const SPEED: int = 150
var ball: CharacterBody2D = Global.ball_node

func _process(_delta: float) -> void:
	if ball and ball.velocity.x > 0:
		velocity.y = signi(int(ball.position.y - position.y)) * SPEED
	else:
		velocity.y = sign(180 - position.y) * SPEED
	move_and_slide()
