extends Resource

class_name ItemResource


@export var item_name : String
@export var item_icon : Texture
@export var item_desc : String


func _init(
	name: String = "",
	icon: Texture = preload("res://icon.svg"),
	desc: String = ""
):
	item_name = name
	item_icon = icon
	item_desc = desc
