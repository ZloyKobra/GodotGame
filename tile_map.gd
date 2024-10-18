extends TileMap

@onready var normal_cat = $"../cat_normal"
@onready var negative_cat = $"../cat_negative"
@onready var lever = $"../lever1"


func _process(delta):
	if Input.is_action_just_pressed("Switch_condition"):
		self.visible = not self.visible
		negative_cat.visible = not negative_cat.visible
		normal_cat.visible = not normal_cat.visible
		lever.visible = not lever.visible
