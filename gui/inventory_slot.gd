extends TextureRect

class_name InventorySlot


signal item_res_put(item_res: ItemResource)

@export var texture_rect: TextureRect
@export var slot_index: int = 0

var inventory_data: InventoryDataResource


func _get_drag_data(position: Vector2) -> Variant:
	return [inventory_data, slot_index]


func _can_drop_data(position: Vector2, data: Variant) -> bool:
	return inventory_data.is_empty(slot_index)


func _drop_data(position: Vector2, data: Variant) -> void:
	var other_inv_data := data[0] as InventoryDataResource
	var other_slot_index: int = data[1]
	var item := other_inv_data.get_item(other_slot_index)
	inventory_data.insert_item(item, slot_index)
	other_inv_data.remove_item(other_slot_index)


func update_item_data() -> void:
	var item_res := get_item_data()
	
	texture_rect.texture = (item_res.item_icon if item_res else null)


func get_item_data() -> ItemResource:
	return inventory_data.get_item(slot_index)
