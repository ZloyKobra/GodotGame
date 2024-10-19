extends CanvasLayer


func _on_level1_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level1.tscn")

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level2.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level3.tscn")


func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_file("pass")


func _on_level_5_pressed() -> void:
	get_tree().change_scene_to_file("pass")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
