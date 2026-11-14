class_name FieldCursorComponent
extends Node

@export var ground_tilemap_layer: TileMap
@export var tilled_soil_tilemap_layer: TileMap
@export var terrain_set: int = 0
@export var terrain: int = 2

@onready var Player = get_tree().get_first_node_in_group("player")

var mouse_position: Vector2
var cell_position: Vector2i
var cell_source_id: int
var local_cell_position: Vector2
var distance: float

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("remove_dirt"):
		if ToolManager.selected_tool == DataTypes.Tools.Attack:
			get_cell_under_mouse()
			remove_tilled_soil_cell()
	elif event.is_action_pressed("hit"):
		if ToolManager.selected_tool == DataTypes.Tools.Attack:
			get_cell_under_mouse()
			add_tilled_soil_cell()
			
func get_cell_under_mouse() -> void:
	mouse_position = ground_tilemap_layer.get_local_mouse_position()
	cell_position = ground_tilemap_layer.local_to_map(mouse_position)
	cell_source_id = ground_tilemap_layer.get_cell_source_id(0, cell_position)
	local_cell_position = ground_tilemap_layer.map_to_local(cell_position)
	distance = Player.global_position.distance_to(local_cell_position)
	
func add_tilled_soil_cell() -> void:
	tilled_soil_tilemap_layer.set_cells_terrain_connect(0,[cell_position], terrain_set, terrain, true)

func remove_tilled_soil_cell() -> void:
	tilled_soil_tilemap_layer.set_cells_terrain_connect(0,[cell_position], 0, -1, true)
