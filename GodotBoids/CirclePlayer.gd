extends CharacterBody3D

@export
var SPEED = 5.0

@export
var JUMP_VELOCITY = 4.5

@export
var SENSITIVITY_HORIZONTAL = 0.1

@export
var SENSITIVITY_VERTICAL = 0.1

@onready
var player_camera_holder = $CameraHolder

@onready
var pause_menu: TabContainer = $"../ui_layer/Control/PauseMenu"

@export
var animation_timer: Timer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var menu_showing = true

func _ready():

	# Set the mouse mode to captured.
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("mouse_toggle") && Input.mouse_mode == Input.MOUSE_MODE_VISIBLE && animation_timer.is_stopped():
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		animation_timer.start()
		menu_showing = true
	elif Input.is_action_just_pressed("mouse_toggle") && Input.mouse_mode == Input.MOUSE_MODE_CAPTURED && animation_timer.is_stopped():
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		animation_timer.start()
		menu_showing = false
		
	if menu_showing == true:
		pause_menu.modulate.a8 = lerp(0, 255, animation_timer.time_left)
	elif menu_showing == false:
		pause_menu.modulate.a8 = lerp(255, 0, animation_timer.time_left)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = lerp(velocity.x, direction.x * SPEED, 0.1)
		velocity.z = lerp(velocity.z, direction.z * SPEED, 0.1)
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.1)
		velocity.z = lerp(velocity.z, 0.0, 0.1)

	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion && Input.mouse_mode == Input.MOUSE_MODE_CAPTURED && menu_showing == true:
		# Rotate the player and the camera.
		rotate_y(deg_to_rad(-event.relative.x * SENSITIVITY_HORIZONTAL))
		player_camera_holder.rotate_x(deg_to_rad(-event.relative.y * SENSITIVITY_VERTICAL))
		player_camera_holder.rotation.x = clamp(player_camera_holder.rotation.x, deg_to_rad(-80), deg_to_rad(80))
