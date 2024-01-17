extends ProgressBar

class_name HPBar


@export var health: Health : set = set_health


func set_health(value: Health) -> void:
	# There should be a signal disconnect here, but we don't usually change the health after the initial set so it should be fine
	
	health = value
	
	# Pull model from observer pattern
	health.max_hp_changed.connect(calc_value.unbind(1))
	health.hp_changed.connect(calc_value.unbind(1))


func calc_value() -> void:
	value = get_hp() * 100 / get_max_hp()


func get_max_hp() -> int:
	return health.max_hp


func get_hp() -> int:
	return health.hp
