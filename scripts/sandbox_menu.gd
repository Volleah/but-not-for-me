extends Control


func _process(_delta):
	if Input.is_action_just_released("open_menu"):
		load_main()

func load_main():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
