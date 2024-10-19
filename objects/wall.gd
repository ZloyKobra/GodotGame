extends Sprite2D

@onready var lever = $"../lever_green"

func _process(delta):
	if Input.is_action_just_pressed("enter"):
		await get_tree().create_timer(0.1).timeout
		if lever.is_on:
			print("ok")
		else:
			print("no ok")
