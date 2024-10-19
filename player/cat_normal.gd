extends Sprite2D

@onready var tile_map = $"../TileMap"
@onready var sprite_2d = $"Sprite2D"
@onready var lever = $"../lever_green"
@onready var red_lever = $"../lever_red"
@onready var yellow_lever = $"../lever_yellow"
@onready var box = $"../Box"
@onready var green_box = $"../GreenBox"
@onready var blue_box = $"../BlueBox"
@onready var button = $"../Button"


var is_moving = false
var is_on_exit = false

func _physics_process(delta):
	if not is_moving:
		return
	if global_position == sprite_2d.global_position:
		is_moving = false
		return
	if not self.visible:
		return
	sprite_2d.global_position = sprite_2d.global_position.move_toward(global_position, 3)

func _process(delta):
	if is_moving:
		return
	if Input.is_action_just_pressed("left"):
		move(Vector2.LEFT)
	elif Input.is_action_just_pressed("right"):
		move(Vector2.RIGHT)
	elif Input.is_action_just_pressed("up"):
		move(Vector2.UP)
	elif Input.is_action_just_pressed("down"):
		move(Vector2.DOWN)


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
	var far_traget_tile: Vector2i = Vector2i(
		 current_tile.x + direction.x * 2,
		current_tile.y + direction.y * 2
	)
	
	var tile_data0: TileData = tile_map.get_cell_tile_data(0, target_tile)
	var tile_data1: TileData = tile_map.get_cell_tile_data(1, target_tile)
	var tile_data2: TileData = tile_map.get_cell_tile_data(2, target_tile)
	var tile_data3: TileData = tile_map.get_cell_tile_data(3, target_tile)
	var tile_data4: TileData = tile_map.get_cell_tile_data(4, target_tile)
	var tile_data5: TileData = tile_map.get_cell_tile_data(5, target_tile)




	if tile_map.map_to_local(target_tile) == box.global_position or tile_map.map_to_local(target_tile) == green_box.global_position:
		
		var far_tile_data0: TileData = tile_map.get_cell_tile_data(0, far_traget_tile)
		var far_tile_data1: TileData = tile_map.get_cell_tile_data(1, far_traget_tile)
		var far_tile_data2: TileData = tile_map.get_cell_tile_data(2, far_traget_tile)
		var far_tile_data3: TileData = tile_map.get_cell_tile_data(3, far_traget_tile)
		var far_tile_data4: TileData = tile_map.get_cell_tile_data(4, far_traget_tile)
		var far_tile_data5: TileData = tile_map.get_cell_tile_data(5, far_traget_tile)


		if far_tile_data5 != null:
			if far_tile_data5.get_custom_data("wall") and not button.is_on:
				return

		if far_tile_data3 != null:
			if far_tile_data3.get_custom_data("wall") and not red_lever.is_on:
				return
				
		if far_tile_data4 != null:
			if far_tile_data4.get_custom_data("wall") and not yellow_lever.is_on:
				return
		
		if far_tile_data2 != null:
			if far_tile_data2.get_custom_data("wall"):
				return
			if far_tile_data2.get_custom_data("exit"):
				is_on_exit = true
			else:
				is_on_exit = false
				
		if far_tile_data1 != null:
			if far_tile_data1.get_custom_data("wall") and not lever.is_on:
				return
		if not far_tile_data0.get_custom_data("walkable"):
			return
			
		if tile_map.map_to_local(target_tile) == blue_box.global_position or tile_map.map_to_local(target_tile) == box.global_position or tile_map.map_to_local(target_tile) == green_box.global_position:
			if tile_map.map_to_local(far_traget_tile) == blue_box.global_position or tile_map.map_to_local(far_traget_tile) == box.global_position or tile_map.map_to_local(far_traget_tile) == green_box.global_position:
				return
			elif tile_map.map_to_local(target_tile) == box.global_position:
					box.move(direction)
			else:
				green_box.move(direction)
				
				
				
	if tile_data5 != null:
		if tile_data5.get_custom_data("wall") and not button.is_on:
			return
			
	if tile_data4 != null:
		if tile_data4.get_custom_data("wall") and not yellow_lever.is_on:
			return

	if tile_data3 != null:
		if tile_data3.get_custom_data("wall") and not red_lever.is_on:
			return

	if tile_data2 != null:
		if tile_data2.get_custom_data("wall"):
			print("sakldsakld;")
			return
		if tile_data2.get_custom_data("exit"):
			is_on_exit = true
		else:
			is_on_exit = false
			
	if tile_data1 != null:
		if tile_data1.get_custom_data("wall") and not lever.is_on:
			return
	if not tile_data0.get_custom_data("walkable"):
		return
	if tile_map.map_to_local(target_tile) == blue_box.global_position:
		return
	is_moving = true
	print("ME!ME!ME!   ", global_position)
	print("BOX!BOX!BOX!  ", box.global_position)
	global_position = tile_map.map_to_local(target_tile)
	sprite_2d.global_position = tile_map.map_to_local(current_tile)
