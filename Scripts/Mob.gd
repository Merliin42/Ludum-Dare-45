extends Area2D

var speed : = 400.0
var path : = PoolVector2Array() setget set_path
var prev_pos


func _ready() -> void:
	print(self.position)

func _process(delta: float) -> void:
	var move_distance : = speed * delta
	move_along_path(move_distance)
	animation()

#func animation():
#	if prev_pos == null:
#		prev_pos = position
#		return
#	if prev_pos.x - position.x > 0:
#		$AnimatedSprite.play("down")
#	elif prev_pos.x - position.x < 0:
#		$AnimatedSprite.play("up")
#	elif prev_pos.y - position.y > 0:
#		$AnimatedSprite.play("left")
#	elif prev_pos.y - position.y < 0:
#		$AnimatedSprite.play("right")
#	else:
#		$AnimatedSprite.stop()
#	prev_pos = position
func animation():
	if prev_pos == null:
		prev_pos = position
		return
	var directionx = prev_pos.x - position.x
	var directiony = prev_pos.y - position.y
	if abs(directionx) > abs(directiony):
		if directionx > 0:
			$AnimatedSprite.play("down")
		elif directionx < 0:
			$AnimatedSprite.play("up")
	elif abs(directionx) < abs(directiony):
		if directiony > 0:
			$AnimatedSprite.play("left")
		elif directiony < 0:
			$AnimatedSprite.play("left")
	else:
		$AnimatedSprite.stop()

func move_along_path(distance : float) -> void:
	var start_point : = position
# warning-ignore:unused_variable
	for i in range(path.size()):
		var distance_to_next : = start_point.distance_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], distance/distance_to_next)
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)

func set_path(value : PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	set_process(true)