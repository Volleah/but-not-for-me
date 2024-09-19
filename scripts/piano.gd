extends Node2D

@export var pianoScale = [1, 3, 5, 6, 8, 10, 12, 13]
@export var keyAmount = 5
var viewport_width
var viewport_height

var key = preload("res://scenes/key.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport = get_viewport().get_visible_rect().size
	viewport_width = viewport.x
	viewport_height = viewport.y
	var keySize: int = 16
	var totalKeyWidth = keySize * keyAmount
	var spot = ((viewport_width - totalKeyWidth) / 2) / keySize
	for pitch in pianoScale:
		var keyInst = key.instantiate()
		keyInst.setupKey(spot, pitch, "white")
		add_child(keyInst)
		spot += 1
