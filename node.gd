extends Node


@onready var global_music = $"Sounds/background.mp3"


func _process(delta: float) -> void:
	if global_music.playing == false:
		global_music.play()
	
