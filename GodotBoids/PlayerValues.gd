extends VBoxContainer

@export_category("General Settings")

@onready
var PlayerSpeed: HSlider = $PlayerSpeedSection/HSlider

@onready
var JumpHeight: HSlider = $JumpHeightSection/HSlider2

@onready
var HorizontalSensitivity: HSlider = $SensitivitySection/HBoxContainer/HorizontalContainer/HorizontalSlider

@onready
var VerticalSensitivity: HSlider = $SensitivitySection/HBoxContainer/VerticalContainer/VerticalSlider

@onready
var ColorfulMode: CheckButton = $ColorfulMode/ColorfulModeButton

@export
var QuitButton: String = ""

@export
var CameraButton: String = ""

# Labels
@onready
var SpeedLabel = $PlayerSpeedSection/Label2

@onready
var JumpLabel = $JumpHeightSection/Label3

@onready
var HorizontalLabel = $SensitivitySection/HBoxContainer/HorizontalContainer/HorizontalValue

@onready
var VerticalLabel = $SensitivitySection/HBoxContainer/VerticalContainer/VerticalValue

@onready
var ColorfulModeState = $ColorfulMode/ColorfulModeState

# Called when the node enters the scene tree for the first time.
func _ready():
	var all_nodes = get_tree().get_nodes_in_group("Player")
	
	# General Settings
	for node in all_nodes:
		PlayerSpeed.value = node.SPEED
		JumpHeight.value = node.JUMP_VELOCITY
		HorizontalSensitivity.value = node.SENSITIVITY_HORIZONTAL
		VerticalSensitivity.value = node.SENSITIVITY_VERTICAL

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_values()
	
	if ColorfulMode.button_pressed:
		colorfulMode()

func change_values():
	var all_nodes = get_tree().get_nodes_in_group("Player")
	
	for node in all_nodes:
		node.SPEED = PlayerSpeed.value
		node.JUMP_VELOCITY = JumpHeight.value
		node.SENSITIVITY_HORIZONTAL = HorizontalSensitivity.value
		node.SENSITIVITY_VERTICAL = VerticalSensitivity.value
		
		SpeedLabel.text = str(PlayerSpeed.value)
		JumpLabel.text = str(JumpHeight.value)
		HorizontalLabel.text = str(HorizontalSensitivity.value)
		VerticalLabel.text = str(VerticalSensitivity.value)

func colorfulMode():
	var all_boids = get_tree().get_nodes_in_group("LightBug")
	
	for boid in all_boids:
		if ColorfulMode.button_pressed:
			ColorfulModeState.text = "true"
			boid.get_node("Meshes").randomizedColorssig.emit()
		else:
			ColorfulModeState.text = "false"
			boid.get_node("Meshes").notrandomizedColorssig.emit()
