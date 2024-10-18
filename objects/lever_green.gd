extends Sprite2D

@onready var cat_negative = $"../cat_negative"
@onready var cat_normal = $"../cat_normal"
@onready var tile_map = $"../TileMap"
@onready var offSprite = $"OffSprite"
@onready var onSprite = $"OnSprite"
var is_moving = false	

func _physics_process(delta):
	if is_moving == false:
		return
	if global_position == offSprite.global_position:
		is_moving = false
		return
	offSprite.global_position = offSprite.global_position.move_toward(global_position, 3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("enter"):
		if self.visible:
			if (global_position == cat_normal.global_position) or (self.global_position == cat_negative.global_position):
				offSprite.visible = not offSprite.visible
				onSprite.visible = not onSprite.visible
