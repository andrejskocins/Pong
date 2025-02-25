extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = str(int($Timer.time_left) + 1)


func _on_timer_timeout() -> void:
	hide()
