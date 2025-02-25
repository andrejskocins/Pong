extends Control

const game_scene: String = "res://scenes/game.tscn"
const menu_scene: String = "res://scenes/menu.tscn"

func _on_easy_pressed() -> void:
	Global.chosen_script = "easy"
	get_tree().change_scene_to_file(game_scene)


func _on_medium_pressed() -> void:
	Global.chosen_script = "medium"
	get_tree().change_scene_to_file(game_scene)


func _on_hard_pressed() -> void:
	Global.chosen_script = "hard"
	get_tree().change_scene_to_file(game_scene)


func _on_chinese_pressed() -> void:
	Global.chosen_script = "chinese"
	get_tree().change_scene_to_file(game_scene)
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(menu_scene)
