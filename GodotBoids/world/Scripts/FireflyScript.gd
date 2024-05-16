extends Node3D

@export
var fireflyLightShine: OmniLight3D

@onready
var fireflyLight: MeshInstance3D = $Light

@onready
var fireflyMat: StandardMaterial3D = $Light.get_surface_override_material(0)

var base_color

@export
var colorfulMode = false

var randomizedColors = false

var randomColor = Color8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255))

var randomColorStatic

var currentColor

signal randomizedColorssig
signal notrandomizedColorssig

@onready
var colorChangingTimer: Timer = $"../Timer"

# Called when the node enters the scene tree for the first time.
func _ready():
	colorChangingTimer
	base_color = fireflyMat.albedo_color
	currentColor = base_color
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if randomizedColors == false && !colorChangingTimer.is_stopped():
		#fireflyLightShine.light_color = lerp(currentColor, base_color, (colorChangingTimer.wait_time - colorChangingTimer.time_left) )
		#fireflyLight.get_surface_override_material(0).albedo_color = lerp(currentColor, base_color, colorChangingTimer)
		fireflyLightShine.light_color = base_color
		fireflyLight.set_surface_override_material(0, fireflyMat)
		base_color = fireflyLight.get_surface_override_material(0)
		currentColor = base_color
	elif randomizedColors == true && !colorChangingTimer.is_stopped():
		randomColorStatic = randomColor
		fireflyMat.albedo_color = randomColorStatic
		#fireflyLightShine.light_color = lerp(currentColor, randomColorStatic, (colorChangingTimer.wait_time - colorChangingTimer.time_left))
		#fireflyLight.get_surface_override_material(0).albedo_color = lerp(currentColor, randomColorStatic, colorChangingTimer)
		fireflyLightShine.light_color = randomColorStatic
		fireflyLight.set_surface_override_material(0, fireflyMat)
		base_color = fireflyLight.get_surface_override_material(0).albedo_color
		currentColor = base_color


func _on_randomized_colorssig():
	randomizedColors = true
	colorChangingTimer.start()

func _on_notrandomized_colorssig():
	randomizedColors = false
	colorChangingTimer.start()
