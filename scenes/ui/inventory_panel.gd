extends PanelContainer

@onready var rock_label: Label = $MarginContainer/VBoxContainer/Rocks/TextureRect/RockLabel
@onready var corn_label: Label = $MarginContainer/VBoxContainer/Corn/TextureRect/CornLabel
@onready var tomato_label: Label = $MarginContainer/VBoxContainer/Tomato/TextureRect/TomatoLabel
@onready var milk_label: Label = $MarginContainer/VBoxContainer/Milk/TextureRect/MilkLabel

func _ready() -> void:
	InventoryManager.inventory_changed.connect(on_inventory_changed)

func on_inventory_changed() -> void:
	var inventory: Dictionary = InventoryManager.inventory
	
	if inventory.has("mineral"): 
		rock_label.text = str(inventory["mineral"])
	
	if inventory.has("corn"): 
		corn_label.text = str(inventory["corn"])
	
	if inventory.has("tomato"): 
		tomato_label.text = str(inventory["tomato"])
		
	if inventory.has("milk"): 
		milk_label.text = str(inventory["milk"])
