extends CanvasLayer


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://levels.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://options.tscn")
