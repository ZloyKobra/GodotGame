extends Sprite2D

@onready var cat_negative = $"../cat_negative"
@onready var cat_normal = $"../cat_normal"
@onready var tile_map = $"../TileMap"
@onready var offSprite = $offSprite
@onready var onSprite = $onSprite
@onready var box = $"../Box"
@onready var green_box = $"../GreenBox"
@onready var blue_box = $"../BlueBox"

var was_on = false
var is_on = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not (global_position == box.global_position or global_position == blue_box.global_position or global_position == green_box.global_position):
		was_on = false
	if was_on:
		return
	if global_position == box.global_position or global_position == blue_box.global_position or global_position == green_box.global_position:
		offSprite.visible = not offSprite.visible
		onSprite.visible = not onSprite.visible
		is_on = not is_on
		was_on = true
		print("i'm on")
