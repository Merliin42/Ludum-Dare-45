extends KinematicBody2D

var velocity = Vector2()
export var SPEED = 200
var animation_playing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")

	velocity.x = -int(left) + int(right)
	velocity.y = -int(up) + int(down)
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		$POL.play("side")
		$popol.play("default")
	elif Input.is_action_pressed("ui_down"):
		$POL.play("down")
		$popol.play("default")
	elif Input.is_action_pressed("ui_up"):
		$POL.play("up")
		$popol.play("default")
	else:
		$POL.stop()
		$popol.stop()
#	if velocity.x != 0:
#		$POL.animation = "right"
#		$POL.flip_v = false
#		# See the note below about boolean assignment
#		$POL.flip_h = velocity.x < 0
#	elif velocity.y != 0:
#		$POL.animation = "up"
	movement_loop()

func movement_loop():
	var motion = velocity.normalized() * SPEED
	move_and_slide(motion)