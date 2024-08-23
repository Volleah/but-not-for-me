extends Node2D

var noteSprite
var audio

func setup(pos: float, pitchScale: float, noteColor: String):
	noteSprite = get_node(noteColor+"Sprite")
	noteSprite.visible=true
	audio = get_node("notePlayer")
	setPos(pos)
	setNote(pitchScale)

func setPos(pos: int):
	var width = 160
	var height = 90
	if (pos<1) or (pos>20):
		print("is NOT in range")
		return
	position.y=74
	position.x=4+(8*(pos-1))

func setNote(pitchScale: float):
	audio.pitch_scale = pitchScale
	

func activate():
	audio.play()
	noteSprite.frame=1

func disable():
	noteSprite.frame=0
