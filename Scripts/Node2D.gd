extends Node2D

onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $Line2D
onready var mob : Sprite = $Mob

func _unhandled_input(event : InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return

	var new_path : = nav_2d.get_simple_path(mob.global_position, event.global_position)
	mob.path = new_path