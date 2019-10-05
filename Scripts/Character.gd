extends Node2D

var movedir = Vector2()
export var SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func controls_loop():
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")

	movedir.x = -int(left) + int(right)
	movedir.y = -int(up) + int(down)
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		$JM.play("side")
	elif Input.is_action_pressed("ui_down"):
		$JM.play("down")
	elif Input.is_action_pressed("ui_up"):
		$JM.play("up")
	else:
		$JM.stop()
	
func movement_loop():
	var motion = movedir.normalized() * SPEED
	