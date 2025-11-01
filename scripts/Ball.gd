extends Area2D

var is_carried: bool = false
var carrier = null

@onready var sprite = $ColorRect
@onready var collision = $CollisionShape2D

func _ready():
	add_to_group("ball")
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if not is_carried and body.is_in_group("players"):
		body.pickup_ball(self)

func set_carrier(player):
	is_carried = true
	carrier = player
	collision.set_deferred("disabled", true)

func drop():
	is_carried = false
	carrier = null
	collision.set_deferred("disabled", false)

func reset_position(pos: Vector2):
	global_position = pos
	drop()
