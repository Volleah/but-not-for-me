@tool

extends Node2D

const FONT := preload("res://assets/fonts/Kenney Future Narrow.ttf")

var _keys: Array = []
var _notes: PackedStringArray = PackedStringArray()

var _active_key: int = -1

@export var key_amount: int = 25
@export var key_width: int = 4
@export var key_height: int = 8

var _total_key_width = key_width * key_amount
var _viewport_size = get_viewport().get_visible_rect().size

func _find_key_pos(_index: int) -> Vector2:
      # viewport size height - key height = initial position y
      # (viewport size width - total key width)/2+(_index-1)*key_width is the x position
      # size is just gonna be key_width and key_height
      var x = _viewport_size.y - key_height
      var y = (_viewport_size.x - _total_key_width) / 2 + (_index * key_width)
      var key_position := Vector2(x, y)
      return key_position


func _activate_key(_index: int) -> void:
      _active_key = _index


class Key:
      var area := Rect2()
      var note: String = ""
      var index: int = -1
      
      func _init(area_: Rect2, note_: String, index_: int) -> void:
            area = area_
            note = note_
            index = index_