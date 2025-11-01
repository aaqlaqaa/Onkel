extends Area2D

@export var goal_owner: int = 1
@export var goal_color: Color = Color.RED

signal goal_scored(scorer_id: int)

@onready var sprite = $ColorRect

func _ready():
	add_to_group("goals")
	sprite.color = goal_color
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("players"):
		if body.has_ball and body.player_id != goal_owner:
			emit_signal("goal_scored", body.player_id)
