extends Node2D
var piano
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	piano = preload("res://scenes/piano.tscn")
	var pianoInst = piano.instantiate()
	add_child(pianoInst)
	player = preload("res://scenes/player.tscn")
	var playerInst = player.instantiate()
	playerInst.position.x = 80
	playerInst.position.y = 50
	add_child(playerInst)

func _prrocess():
	if Input.is_action_pressed("restart"):
		_ready()