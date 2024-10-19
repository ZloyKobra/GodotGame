extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")

var master_bus = AudioServer.get_bus_index("Master")
var effects_bus = AudioServer.get_bus_index("New Bus")


func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus, value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)

func _on_effects_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(effects_bus, value)
	if value == -30:
		AudioServer.set_bus_mute(effects_bus, true)
	else:
		AudioServer.set_bus_mute(effects_bus, false)
