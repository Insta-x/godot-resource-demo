extends Resource

class_name Health


signal max_hp_changed(max_hp: int)
signal hp_changed(hp: int)

@export var max_hp := 3 : set = set_max_hp
@export var hp := 3 : set = set_hp


func set_max_hp(value: int) -> void:
	max_hp = max(1, value)
	max_hp_changed.emit(max_hp)
	
	hp = clampi(hp, 0, max_hp)


func set_hp(value: int) -> void:
	hp = clampi(value, 0, max_hp)
	hp_changed.emit(hp)
