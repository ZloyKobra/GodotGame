extends TileMap

@onready var normal_cat = $"../cat_normal"
@onready var negative_cat = $"../cat_negative"
@onready var win_sprite = $"../ShefWin"
@onready var green_box = $"../GreenBox"
@onready var blue_box = $"../BlueBox"

var win_sound_played = false
func _process(delta):
	if normal_cat.is_on_exit and negative_cat.is_on_exit and not win_sound_played:
		win_sprite.visible = true
		$"../win_sound".play()
		win_sound_played = true
	if Input.is_action_just_pressed("Switch_condition"):
		$"../swap_sound".play()
		self.visible = not self.visible
		negative_cat.visible = not negative_cat.visible
		normal_cat.visible = not normal_cat.visible
