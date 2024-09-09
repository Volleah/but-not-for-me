extends Control

var musicConfig = ConfigFile.new()

func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("open_menu"):
		visible = !visible
