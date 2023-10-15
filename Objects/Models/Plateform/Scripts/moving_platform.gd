extends AnimatableBody3D

# Export the positions for each platform
@export var start_position: Vector3 = Vector3(0, 0, 0)
@export var end_position: Vector3 = Vector3(0, 5, 0)
@export var speed: float = 2.0

var time = 0.0

func _process(delta):
	time += delta
	var t = sin(time * speed) * 0.5 + 0.5
	var new_position = lerp(start_position, end_position, t)
	transform.origin = new_position
