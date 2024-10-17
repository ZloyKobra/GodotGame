extends CharacterBody2D

var direction = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_left"):
		direction.x -= 128
	elif Input.is_action_just_pressed("ui_right"):
		direction.x += 128
	elif Input.is_action_just_pressed("ui_up"):
		direction.y -= 128
	elif Input.is_action_just_pressed("ui_down"):
		direction.y += 128

	else:
		direction.y = 0
		direction.x = 0
	move_and_collide(direction)
