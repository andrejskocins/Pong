extends VBoxContainer

var is_paused = false  # Track pause state
var menu_scene: String = "res://scenes/menu.tscn"
@export var pause_dim: ColorRect
@export var game_scene: Node2D

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE and not Global.game_over:
		toggle_pause()

func toggle_pause():
	is_paused = !is_paused
	get_tree().paused = is_paused  # Freeze the game
	visible = is_paused  # Show/hide menu
	pause_dim.visible = is_paused # Dim the game on pause

func _on_continue_pressed() -> void:
	toggle_pause()


func _on_restart_pressed() -> void:
	toggle_pause()
	game_scene.restart_game()


func _on_back_to_menu_pressed() -> void:
	toggle_pause()
	get_tree().change_scene_to_file(menu_scene)
