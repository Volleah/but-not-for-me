extends CharacterBody2D

@export var gravity = 32.0
@export var walkSpeed = 32.0
@export var dashSpeed = 1000.0
@export var jumpSpeed = 500.0

var animatedSprite

var dashDirection = Vector2.RIGHT
var canDash = false
var dashing = false

func _ready():
	animatedSprite = get_node("playerAnimatedSprite")

func _process(_delta):
	animatedSprite.play()

func _physics_process(delta):
	var motion = velocity * delta
	move_and_collide(motion)

	if Input.is_action_pressed("move_left"):
		velocity.x = -walkSpeed
	elif Input.is_action_pressed("move_right"):
		velocity.x = walkSpeed
	elif Input.is_action_pressed("move_up") and is_on_floor():
		velocity.y -= delta * jumpSpeed
	elif Input.is_action_pressed("move_down") and not is_on_floor():
		velocity.y += delta * jumpSpeed
	else:
		velocity.x = 0
		velocity.y += delta * gravity
	
	dash()

	move_and_slide()

func dash():
	if is_on_floor():
		canDash = true
	
	if Input.is_action_pressed("move_right"):
		dashDirection = Vector2.RIGHT
	if Input.is_action_pressed("move_left"):
		dashDirection = Vector2.LEFT
	if Input.is_action_just_pressed("move_dash") and canDash:
		velocity = dashDirection.normalized() * dashSpeed
		canDash = false
		dashing = true
		await get_tree().create_timer(0.2).timeout
		dashing = false
