class_name Spiral extends SteeringBehavior

# This Godot Boid behaviour is original, and involves the boid Going towards the center, and then some more distance away from the center.
# It also switches directions when it reaches the max or min distance from the center.
var min_radius: float = 5.0
var max_radius: float = 10.0

func _ready():
	boid = get_parent()

func _process(delta):
	pass

func calculate() -> Vector3:
	var center = Vector3(0, boid.global_transform.origin.y, 0)
	var direction = center - boid.global_transform.origin
	var distance = direction.length()
	if distance < min_radius:
		return direction.normalized() * boid.max_speed
	elif distance > max_radius:
		return direction.normalized() * boid.max_speed
	else:
		return Vector3((direction.normalized() * boid.max_speed).x + 20, 0, (direction.normalized() * boid.max_speed).z)
