extends CharacterBody2D

class_name Player


@export var movespeed := 300.0
@export var health: Health


func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("move_left", "move_right")
	var direction_y := Input.get_axis("move_up", "move_down")
	
	velocity = Vector2(direction_x, direction_y).normalized() * movespeed
	
	move_and_slide()


func _on_hurtbox_area_entered(_area: Area2D) -> void:
	health.hp -= 1
