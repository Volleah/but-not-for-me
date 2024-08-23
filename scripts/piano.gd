extends Node2D
var key = preload("res://scenes/key.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in range(1, 21):
		var keyInst = key.instantiate()
		keyInst.setupKey(n, n, "white")
		add_child(keyInst)
