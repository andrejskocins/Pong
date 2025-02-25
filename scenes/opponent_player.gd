extends CharacterBody2D

const SPEED: int = 150

func _process(_delta: float) -> void:
	var direction = Input.get_axis("Up2P", "Down2P")
	velocity = Vector2(0, direction * SPEED)
	move_and_slide()
