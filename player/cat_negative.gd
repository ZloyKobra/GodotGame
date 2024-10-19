extends Sprite2D

@onready var tile_map = $"../TileMap_negative"
@onready var sprite_2d = $"Sprite2D"

@onready var lever = $"../lever_blue"
var is_moving = false
var is_on_exit = false
>>>>>>> bb0710cf9c257cfaabe81086712daf91a974c4c0:player/cat_negative.gd

func _init():
	self.visible = false

func _physics_process(delta):
	if not is_moving:
>>>>>>> bb0710cf9c257cfaabe81086712daf91a974c4c0:player/cat_negative.gd
		return
	if global_position == sprite_2d.global_position:
		state = states[1]
		return
	if not self.visible:
		return
	sprite_2d.global_position = sprite_2d.global_position.move_toward(global_position, 3)

func _process(delta):
	if is_moving:
>>>>>>> bb0710cf9c257cfaabe81086712daf91a974c4c0:player/cat_negative.gd
		return
	if Input.is_action_just_pressed("left"):
		move(Vector2.LEFT)
	elif Input.is_action_just_pressed("right"):
		move(Vector2.RIGHT)
	elif Input.is_action_just_pressed("up"):
		move(Vector2.UP)
	elif Input.is_action_just_pressed("down"):
		move(Vector2.DOWN)
>>>>>>> bb0710cf9c257cfaabe81086712daf91a974c4c0:player/cat_negative.gd

func move(direction: Vector2):
	if is_moving:
		return
	if not self.visible:
		return
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	var target_tile: Vector2i = Vector2i(
		 current_tile.x + direction.x,
		current_tile.y + direction.y
	)
	
	var tile_data0: TileData = tile_map.get_cell_tile_data(0, target_tile)
	var tile_data1: TileData = tile_map.get_cell_tile_data(1, target_tile)
	var tile_data2: TileData = tile_map.get_cell_tile_data(2, target_tile)
	
	if tile_data2 != null:
		if tile_data2.get_custom_data("exit"):
			is_on_exit = true
		else:
			is_on_exit = false
			
	if tile_data1 != null:
		if not tile_data1.get_custom_data("wall") and not lever.is_on:
			return
	if not tile_data0.get_custom_data("walkable"):
		return
	state = states[0]
	global_position = tile_map.map_to_local(target_tile)
	sprite_2d.global_position = tile_map.map_to_local(current_tile)
