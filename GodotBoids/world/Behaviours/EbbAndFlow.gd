class_name EbbAndFlow extends SteeringBehavior

# This Godot Boid behaviour is original, and involves the boid Going towards the center, and then some more distance away from the center.
# It also switches directions when it reaches the max or min distance from the center.
var min_radius: float = -50.0
var max_radius: float = 50.0

func _ready():
	boid = get_parent()

func _process(delta):
	pass

# function returns force vector to apply to boid
func calculate() -> Vector3:
	# get the boid's position
	var position = boid.global_transform.origin

	# get the center of the map
	var center = Vector3(0, boid.global_transform.origin.y, 0)

	# get the vector from the boid to the center
	var distance = boid.global_transform.origin.distance_to(center)

	var force = Vector3(0, 0, 0)

	# if the boid is too close to the center, move it away
	if distance < min_radius:
		force = (position - center).normalized() * boid.max_speed
	# if the boid is too far from the center, move it closer
	elif distance > max_radius:
		force = (center - position).normalized() * boid.max_speed
		
	print(force)

	return force
