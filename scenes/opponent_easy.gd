extends CharacterBody2D


const SPEED: int = 150
var ball: CharacterBody2D


func _process(_delta: float) -> void:
	ball = Global.ball_node
	if ball:
		velocity.y = signi(int(ball.position.y - position.y)) * SPEED
	else:
		velocity.y = sign(180 - position.y) * SPEED
	move_and_slide()
