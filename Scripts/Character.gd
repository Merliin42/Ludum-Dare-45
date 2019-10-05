extends KinematicBody2D

var velocity = Vector2()
var screen_size  # Size of the game window.
export var SPEED = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	

func _process(delta):
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")

	velocity.x = -int(left) + int(right)
	velocity.y = -int(up) + int(down)
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		$POL.play("side")
	elif Input.is_action_pressed("ui_down"):
		$POL.play("down")
	elif Input.is_action_pressed("ui_up"):
		$POL.play("up")
	else:
		$POL.stop()
	if velocity.x != 0:
		$POL.animation = "right"
		$POL.flip_v = false
		# See the note below about boolean assignment
		$POL.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$POL.animation = "up"
	movement_loop()
#	position += velocity * delta
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
func movement_loop():
	var motion = velocity.normalized() * SPEED
	move_and_slide(motion)
	
	