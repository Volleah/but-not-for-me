@tool

extends Node2D

const FONT := preload("res://assets/fonts/Kenney Future Narrow.ttf")

var _keys: Array = []
var _notes: PackedStringArray = PackedStringArray()

var _activeKey: int = -1

class Key:
      var area: Rect2 = Rect2()
      var note: String = ""
      var index: int = -1
      
      func _init(area_: Rect2, note_: String, index_: int) -> void:
            area = area_
            note = note_
            index = index_