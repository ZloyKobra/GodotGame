extends TileMap

func _init():
	self.visible = false

func _process(delta):
	if Input.is_action_just_pressed("Switch_condition"):
		self.visible = not self.visible
