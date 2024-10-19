extends Sprite2D

@onready var tile_map = $"../TileMap"
@onready var sprite_2d = $"Sprite2D"
@onready var lever = $"../lever_blue"
@onready var box = $"../Box"
@onready var blue_box = $"../BlueBox"
var is_moving = false

func _physics_process(delta):
	if not is_moving:
		return
	if global_position == sprite_2d.global_position:
		is_moving = false
		return
	sprite_2d.global_position = sprite_2d.global_position.move_toward(global_position, 3)

func move(direction: Vector2):
	if is_moving:
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
			return
	if tile_data1 != null:
		if not tile_data1.get_custom_data("wall") and not lever.is_on:
			return
	if not tile_data0.get_custom_data("walkable"):
		return
	if tile_map.map_to_local(target_tile) == blue_box.global_position or tile_map.map_to_local(target_tile) == box.global_position:
		return
	is_moving = true
	global_position = tile_map.map_to_local(target_tile)
	sprite_2d.global_position = tile_map.map_to_local(current_tile)
