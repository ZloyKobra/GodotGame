extends TileMap

@onready var normal_cat = $"../cat_normal"
@onready var negative_cat = $"../cat_negative"
@onready var win_sprite = $"../ShefWin"
@onready var green_box = $"../GreenBox"
@onready var blue_box = $"../BlueBox"



func _process(delta):
	if normal_cat.is_on_exit and negative_cat.is_on_exit:
		pass
		#print(get_tree().current_scene.)
		#get_tree().change_scene_to_file()
	if Input.is_action_just_pressed("Switch_condition"):
		self.visible = not self.visible
		negative_cat.visible = not negative_cat.visible
		normal_cat.visible = not normal_cat.visible
