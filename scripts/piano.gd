extends Node2D

@export var pianoScale = [1, 3, 5, 6, 8, 10, 12, 13]
@export var startSpot = 3

var key = preload("res://scenes/key.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var spot = startSpot
	for pitch in pianoScale:
		var keyInst = key.instantiate()
		keyInst.setupKey(spot, pitch, "white")
		add_child(keyInst)
		spot += 1
