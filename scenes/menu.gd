extends Control

# scenes
const game_scene: String = "res://scenes/game.tscn"
const difficulty_menu_scene: String = "res://scenes/difficulty_menu.tscn"

# nodes
@export var score_label: Label
@export var score_slider: HSlider

func _ready() -> void:
	score_slider.value = Global.max_score
	var bar_increase = create_tween()
	bar_increase.tween_property($VBoxContainer/ColorRect, "custom_minimum_size", Vector2(508, 5), 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	
func _on_play_vs_ai_pressed() -> void:
	get_tree().change_scene_to_file(difficulty_menu_scene)

func _on_play_vs_player_pressed() -> void:
	Global.chosen_script = "player"
	Global.multiplayer_mode = true
	get_tree().change_scene_to_file(game_scene)

func _on_score_selector_value_changed(value: float) -> void:
	Global.max_score = int(value)
	score_label.text = str(value)

func _on_quit_pressed() -> void:
	get_tree().quit()
