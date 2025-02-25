extends Node

var max_score: int = 3

var multiplayer_mode: bool = false

var ball_node: CharacterBody2D

var game_over: bool = false

var chosen_script: String = "easy"
var opponent_scripts: Dictionary = {
	 "player": "res://scenes/opponent_player.gd",
	   "easy": "res://scenes/opponent_easy.gd",
	 "medium": "res://scenes/opponent_medium.gd",
	   "hard": "res://scenes/opponent_hard.gd",
	"chinese": "res://scenes/opponent_chinese.gd"
}
