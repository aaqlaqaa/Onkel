extends Control

@onready var score_label = $ScoreLabel

func _ready():
	update_score(0, 0)

func update_score(p1_score: int, p2_score: int):
	score_label.text = "Player 1: %d  |  Player 2: %d" % [p1_score, p2_score]
