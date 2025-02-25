extends CharacterBody2D

const SPEED: int = 150

func _physics_process(_delta: float) -> void:
	var direction = Input.get_axis("Up", "Down")
	velocity = Vector2(0, direction * SPEED)
	move_and_slide()
