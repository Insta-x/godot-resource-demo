extends Resource

class_name InventoryDataResource


signal slot_changed(slot_index: int)

@export var item_capacity: int = 4
@export var items: Array[ItemResource] = []


func _init() -> void:
#	print("InventoryDataResource _init() test")
	
	while items.size() < item_capacity:
		items.append(null)


func is_empty(slot_index: int) -> bool:
	return items[slot_index] == null


func get_item(slot_index: int) -> ItemResource:
	return items[slot_index]


func append_item(item: ItemResource) -> bool:
	for index in range(item_capacity):
		if not items[index]:
			items[index] = item
			
			slot_changed.emit(index)
			
			return true
	return false


func insert_item(item: ItemResource, slot_index: int) -> void:
	items[slot_index] = item
#	print("slot %s %d %d item inserted" % [item, slot_type, slot_index])
	slot_changed.emit(slot_index)


func remove_item(slot_index: int) -> void:
	items[slot_index] = null
#	print("slot %d %d item removed" % [slot_type, slot_index])
	slot_changed.emit(slot_index)
