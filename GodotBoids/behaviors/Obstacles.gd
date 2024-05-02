extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

@export var obstacle_scene:PackedScene

@export var count = 5

@export var radius = 5
@export var bubble_radius = 5 

@export var center_path:NodePath
var center

# Called when the node enters the scene tree for the first time.
func _ready():
	center = get_node(center_path)
	for i in count:
		var o = obstacle_scene.instantiate()		
		add_child(o)
		var pos = Vector3(
			randf_range(-50, 50),  # X coordinate between -50 and 50
			randf_range(25, 50),   # Y coordinate between 25 and 50
			randf_range(-50, 50)   # Z coordinate between -50 and 50
		)	
		o.global_transform.origin = pos
		o.global_transform.basis = Basis(Vector3.UP, randf_range(0, PI * 2.0))
		var constrain = o.find_child("Constrain", true)
			
		constrain.center = center
		constrain.radius = radius
		o.global_transform.basis = o.global_transform.basis.scaled(Vector3(bubble_radius, bubble_radius, bubble_radius))		
		
	pass
