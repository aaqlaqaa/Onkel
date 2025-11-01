extends Node2D

var player1_score: int = 0
var player2_score: int = 0

@onready var player1 = $Player1
@onready var player2 = $Player2
@onready var ball = $Ball
@onready var goal1 = $Goal1
@onready var goal2 = $Goal2
@onready var hud = $CanvasLayer/HUD

var player1_spawn_pos: Vector2
var player2_spawn_pos: Vector2
var ball_spawn_pos: Vector2

func _ready():
	# Store spawn positions
	player1_spawn_pos = player1.global_position
	player2_spawn_pos = player2.global_position
	ball_spawn_pos = ball.global_position
	
	# Connect goal signals
	goal1.connect("goal_scored", _on_goal_scored)
	goal2.connect("goal_scored", _on_goal_scored)
	
	# Update HUD
	update_hud()

func _on_goal_scored(scorer_id: int):
	if scorer_id == 1:
		player1_score += 1
	else:
		player2_score += 1
	
	update_hud()
	reset_positions()

func reset_positions():
	# Reset player positions
	player1.global_position = player1_spawn_pos
	player1.velocity = Vector2.ZERO
	player1.drop_ball()
	
	player2.global_position = player2_spawn_pos
	player2.velocity = Vector2.ZERO
	player2.drop_ball()
	
	# Reset ball position
	ball.reset_position(ball_spawn_pos)

func update_hud():
	hud.update_score(player1_score, player2_score)
