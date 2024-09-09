@tool

extends Node2D

const NOTE_WIDTH := 4


func _draw() -> void:
	_draw_key_boxes(_normal_key_boxes, Color.ANTIQUE_WHITE, Color.BLACK, Color.BLACK, true)
	_draw_key_boxes(_sharp_key_boxes, Color.BLACK, Color.WEB_GRAY, Color.WHITE, false)