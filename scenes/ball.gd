extends CharacterBody2D

var speed = 150
var speed_increase = 50

func _on_timer_timeout() -> void:
	show()
	speed = 150
	velocity = Vector2(1, randf_range(-1, 1)).normalized() * speed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.name == "Walls":
			velocity.y = -velocity.y
		else:
			speed += speed_increase
			velocity = Vector2(-sign(velocity.x), (position.y - collider.position.y) / 50).normalized() * speed
