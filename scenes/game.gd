extends Node2D

# scenes
const menu_scene: String = "res://scenes/menu.tscn"

# nodes
@export var opponent: CharacterBody2D
@export var ball_node_a: CharacterBody2D
@export var left_scoreboard:  Label
@export var right_scoreboard: Label
@export var countdown: Label
@export var end_round_screen: VBoxContainer
@export var winner_label: Label

# globals
var game_in_progress: bool = true
var left_wins: bool

func _ready() -> void:
	Global.ball_node = ball_node_a
	var script = load(Global.opponent_scripts[Global.chosen_script])
	opponent.set_script(script)
	opponent.set_process(true)

func _on_left_goal_body_entered(body: Node2D) -> void:
	update_ui(right_scoreboard)
	reset_ball(body)

func _on_right_goal_body_entered(body: Node2D) -> void:
	update_ui(left_scoreboard)
	reset_ball(body)

func reset_ball(ball: Node2D) -> void:
	ball.hide()
	ball.velocity = Vector2.ZERO
	ball.position = Vector2(320, 180)
	if game_in_progress:
		$Countdown/Timer.start()
		countdown.show()

func update_ui(scoreboard: Label) -> void:
	
	scoreboard.text = str(int(scoreboard.text) + 1)
	
	# If someone has won
	if int(scoreboard.text) >= Global.max_score:
		Global.game_over = true
		# end screen text
		var score_difference = int(left_scoreboard.text) - int(right_scoreboard.text)
		if score_difference > 0:
			left_wins = true
		else:
			left_wins = false
		
		var end_of_round_text: String = ""
		if Global.multiplayer_mode:
			if left_wins: end_of_round_text = "P1 WINS!"
			else:         end_of_round_text = "P2 WINS!"
		else:
			if left_wins: end_of_round_text = "YOU WIN!"
			else:         end_of_round_text = "YOU LOSE!"
		
		game_in_progress = false
		winner_label.text = end_of_round_text
		end_round_screen.show()


func _on_play_again_pressed() -> void:
	restart_game()
	
func restart_game() -> void:
	end_round_screen.hide()
	$Countdown/Timer.start()
	countdown.show()
	left_scoreboard.text = "0"
	right_scoreboard.text = "0"
	Global.game_over = false


func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file(menu_scene)
