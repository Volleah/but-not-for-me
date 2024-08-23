extends CharacterBody2D

@export var Gravity = 4.0
@export var WalkSpeed = 32.0
var animatedSprite

func _ready():
	animatedSprite = get_node("playerAnimatedSprite")

func _process(_delta):
	animatedSprite.play()

func _physics_process(delta):
	var motion = velocity * delta
	move_and_collide(motion)
	if Input.is_action_pressed("move_left"):
		velocity.x = -WalkSpeed
	elif Input.is_action_pressed("move_right"):
		velocity.x = WalkSpeed
	elif Input.is_action_pressed("move_up"):
		velocity.y -= delta * Gravity * 5
		velocity.x = 0
	elif Input.is_action_pressed("move_down"):
		velocity.y += delta * Gravity * 5
	else:
		velocity.x = 0
		velocity.y += delta * Gravity
	move_and_slide()