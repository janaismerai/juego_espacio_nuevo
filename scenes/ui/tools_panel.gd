extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_rock: Button = $MarginContainer/HBoxContainer/ToolRock
@onready var tool_watering_can: Button = $MarginContainer/HBoxContainer/ToolWateringCan
@onready var tool_wheat: Button = $MarginContainer/HBoxContainer/ToolWheat
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/ToolTomato

func _on_tool_axe_pressed():
	ToolManager.select_tool(DataTypes.Tools.Attack)

func _on_tool_rock_pressed():
	ToolManager.select_tool(DataTypes.Tools.InteracciónPuzzle)
	
func _on_tool_watering_can_pressed():
	ToolManager.select_tool(DataTypes.Tools.Farming)

func _on_tool_wheat_pressed():
	ToolManager.select_tool(DataTypes.Tools.PlantCorn)

func _on_tool_tomato_pressed():
	ToolManager.select_tool(DataTypes.Tools.PlantTomato)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release_tool"):
		ToolManager.select_tool(DataTypes.Tools.None)
		tool_axe.release_focus()
		tool_rock.release_focus()
		tool_watering_can.release_focus()
		tool_wheat.release_focus()
		tool_tomato.release_focus()
