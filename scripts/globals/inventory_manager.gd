extends Node

var inventory: Dictionary = Dictionary()
	
signal inventory_changed

func add_collectable(collectable_name: String) -> void:
	if not inventory.has(collectable_name) or inventory[collectable_name] == null:
		inventory[collectable_name] = 1
	else:
		inventory[collectable_name] += 1

	inventory_changed.emit()
