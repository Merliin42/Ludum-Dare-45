extends Node2D

onready var nav_2d : Navigation2D = $Map
onready var mob : Area2D = $Mob
var newPos
var seen = false

func _on_Timer_timeout():
	newPos = setNewPos(seen)
	var new_path : = nav_2d.get_simple_path(mob.global_position, newPos)
	mob.path = new_path

func _on_Mob_body_entered(body):
	if(body != $Character):
		return
	seen = true

func setNewPos(seen):
	if seen == true:
		return $Character.global_position
	else:
		randomize()
		var value = Vector2()
		value.x = rand_range(3100, 5200)
		value.y = rand_range(995, 7500)
		return value

func _on_Mob_body_exited(body):
	if(body != $Character):
		return
	seen = false
