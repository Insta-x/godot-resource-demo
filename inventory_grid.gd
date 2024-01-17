extends GridContainer

class_name InventoryGrid


@export var inventory_data: InventoryDataResource

var grids: Array[InventorySlot] = []


func _ready() -> void:
	if not inventory_data:
		inventory_data = InventoryDataResource.new()
	
	setup_slot()
	
	inventory_data.slot_changed.connect(
		func(slot_index: int) -> void:
			grids[slot_index].update_item_data()
	)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		hide() if visible else show()
		get_viewport().set_input_as_handled()


func setup_slot() -> void:
	for child in get_children():
		grids.append(child)
	
	for index in range(inventory_data.item_capacity):
		grids[index].inventory_data = inventory_data
		grids[index].update_item_data()


func append_item(item: ItemResource) -> bool:
	return inventory_data.append_item(item)
