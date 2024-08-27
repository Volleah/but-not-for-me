extends Node2D

var NoteSprite
var Note


func setupKey(pos: int, pitchScale: int, noteColor: String):
	NoteSprite = get_node(noteColor + "Sprite")
	NoteSprite.visible = true
	NoteSprite.frame = 0
	Note = get_node("notePlayer")
	setPos(pos)
	setNote(pitchScale)

func setPos(pos: int):
	position.y = 74
	position.x = 4 + (8 * (pos - 1))

func setNote(pitchScale: int):
	Note.pitch_scale = pitchScale
	

func activate():
	Note.play()
	NoteSprite.frame = 1

func disable():
	NoteSprite.frame = 0


func _on_note_area_body_entered(_body: Node2D):
	activate()

func _on_note_area_body_exited(_body: Node2D):
	disable()
