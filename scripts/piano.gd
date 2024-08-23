extends Node2D
var key = preload("res://scripts/key.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in 20:
		var keyInst = key.instance
		keyInst.Setup(n,n,"white")
		add_child(keyInst)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
