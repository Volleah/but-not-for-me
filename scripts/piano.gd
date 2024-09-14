@tool

extends Node2D

const FONT := preload("res://assets/fonts/Kenney Future Narrow.ttf")

var _keys: Array = [Key]
var _notes: PackedStringArray = PackedStringArray()

var _active_key: int = -1

@export var key_amount: int = 25
@export var key_width: int = 4
@export var key_height: int = 8
@export var key_color: Color = Color.WHITE

var _total_key_width
var _viewport_size

func _ready():
	_total_key_width = key_width * key_amount
	_viewport_size = get_viewport().get_visible_rect().size
	_init_notes()
	_init_keys()

func _process(_delta):
	queue_redraw()

func _draw():
	_draw_keys()

func _find_key_pos(_index: int) -> Vector2:
	  # viewport size height - key height = initial position y
	  # (viewport size width - total key width)/2+(_index-1)*key_width is the x position
	  # size is just gonna be key_width and key_height
	var x = _viewport_size.y - key_height
	var y = (_viewport_size.x - _total_key_width) / 2 + (_index * key_width)
	var key_position := Vector2(x, y)
	return key_position

func _find_key_area(_index: int) -> Rect2:
	var _area: Rect2
	var _size: Vector2 = Vector2(key_width, key_height)
	var _pos: Vector2 = _find_key_pos(_index)
	_area = Rect2(_pos, _size)
	return _area

func _init_notes() -> void:
	_notes = PackedStringArray(["c", "c#", "d", "d#", "e", "f", "f#", "g", "g#", "a", "a#", "b"])

func _init_keys() -> void:
	for n in range(0, key_amount):
		var key_ = _init_key(n)
		_keys.append(key_)
		print("initialized this key")
		key_.print_key()

func _init_key(_index: int):
	var _scale: int = _index / 12
	var note_index: int = _index % 12
	var _note: String = _notes[note_index]
	var _area: Rect2 = _find_key_area(_index)
	var key_ = Key.new(_area, _note, _index, _scale)
	return key_

func _draw_keys():
	for _key in _keys:
		_key.print_key()
		var area_: Rect2 = _key.get_area()
		draw_rect(area_, key_color)
		print("drawn this key with this area", area_)
		

func _activate_key(_index: int) -> void:
	_active_key = _index

class Key:
	var area: Rect2 = Rect2(0, 0, 0, 0)
	var note: String = ""
	var index: int = -1
	var scale: int = 0
	func _init(area_: Rect2, note_: String, index_: int, scale_: int) -> void:
		area = area_
		note = note_
		index = index_
		scale = scale_
	
	func get_area() -> Rect2:
		return area
	
	func print_key():
		print("area:", area)
		print("note:", note)
		print("index:", index)
		print("scale:", scale)