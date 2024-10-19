extends Sprite2D

@onready var tile_map = $"../TileMap"
@onready var sprite_2d = $"Sprite2D"
var visible_ = true
var states = ['on_the_move', 'to_stand']
var state = states[1]

func _init():
	self.visible = false
	
func _physics_process(delta):
	if state == states[1]:
		return
	if global_position == sprite_2d.global_position:
		state = states[1]
		return
	
	sprite_2d.global_position = sprite_2d.global_position.move_toward(global_position, 1)
	
func _process(delta):
	print(state, "   ", self.visible, "  cat_2")
	if state == states[0]:
		return
	if Input.is_action_just_pressed("left"):
		move(Vector2.LEFT)
	elif Input.is_action_just_pressed("right"):
		move(Vector2.RIGHT)
	elif Input.is_action_just_pressed("up"):
		move(Vector2.UP)
	elif Input.is_action_just_pressed("down"):
		move(Vector2.DOWN)
	if state == states[0]:
		return
	elif Input.is_action_just_pressed("Switch_condition") and state == states[1]:
		self.visible = not self.visible

func move(direction: Vector2):
	if not self.visible:
		return
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	var target_tile: Vector2i = Vector2i(
		 current_tile.x + direction.x,
		current_tile.y + direction.y
	)
	var tile_data: TileData = tile_map.get_cell_tile_data(0, target_tile)
	
	if tile_data.get_custom_data("walkable") == false:
		return
	state = states[0]
	global_position = tile_map.map_to_local(target_tile)
	sprite_2d.global_position = tile_map.map_to_local(current_tile)
	
