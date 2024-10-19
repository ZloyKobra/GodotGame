extends Control

@onready var audio_stream_start = $"start"

func _ready() -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level1.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://levels.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://options.tscn")
