extends CharacterBody2D

@export var player_id: int = 1
@export var player_color: Color = Color.BLUE

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const ACCELERATION = 1500.0
const FRICTION = 1200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_ball: bool = false
var ball_reference = null

@onready var sprite = $ColorRect
@onready var collision = $CollisionShape2D

func _ready():
	sprite.color = player_color
	add_to_group("players")

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Get input based on player ID
	var input_left = "p1_left" if player_id == 1 else "p2_left"
	var input_right = "p1_right" if player_id == 1 else "p2_right"
	var input_jump = "p1_jump" if player_id == 1 else "p2_jump"
	
	# Handle jump
	if Input.is_action_just_pressed(input_jump) and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle horizontal movement
	var direction = 0
	if Input.is_action_pressed(input_left):
		direction -= 1
	if Input.is_action_pressed(input_right):
		direction += 1
	
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
	
	move_and_slide()
	
	# Update ball position if carrying it
	if has_ball and ball_reference:
		ball_reference.global_position = global_position + Vector2(0, -40)

func pickup_ball(ball):
	has_ball = true
	ball_reference = ball
	ball.set_carrier(self)

func drop_ball():
	if has_ball and ball_reference:
		has_ball = false
		ball_reference.drop()
		ball_reference = null

func get_tackled():
	if has_ball:
		drop_ball()

func _on_tackle_area_body_entered(body):
	if body.is_in_group("players") and body != self:
		if body.has_ball and not has_ball:
			body.get_tackled()
