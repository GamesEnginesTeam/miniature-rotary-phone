extends VBoxContainer

@export_category("General Settings")

@onready
var Speed: HSlider = $Speed/HSlider

@onready
var Max_Speed: HSlider = $Max_Speed/HSlider2

@onready
var Max_Force: HSlider = $Max_Force/HSlider2

@onready
var Banking: HSlider = $Banking/HSlider2

@onready
var Damping: HSlider = $Damping/HSlider2

@onready
var GizmosButton: Button = $Gizmos/Button

# Labels
@onready
var Speed_Label: Label = $Speed/Label2

@onready
var Max_Speed_Label: Label = $Max_Speed/Label3

@onready
var Max_Force_Label: Label = $Max_Force/Label3

@onready
var Damping_Label: Label = $Banking/Label3

@onready
var Banking_Label: Label = $Damping/Label3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_values()

func change_values():
	var all_boids = get_tree().get_nodes_in_group("Boid")
	
	for boid in all_boids:
		boid.speed = Speed.value
		boid.max_speed = Max_Speed.value
		boid.max_force = Max_Force.value
		boid.damping = Damping.value
		boid.banking = Banking.value  
		if GizmosButton.pressed:
			toggleGizmos()
		
	Speed_Label.text = str(Speed.value)
	Max_Speed_Label.text = str(Max_Speed.value)
	Max_Force_Label.text = str(Max_Force.value)
	Damping_Label.text = str(Damping.value)
	Banking_Label.text = str(Banking.value)
		
func toggleGizmos():
	var all_boids = get_tree().get_nodes_in_group("Boid")
	
	for boid in all_boids:
		if GizmosButton.pressed && GizmosButton.button_pressed:
			GizmosButton.text = "Enabled"
			boid.draw_gizmos_recursive(true)
		elif GizmosButton.pressed && !GizmosButton.button_pressed:
			GizmosButton.text = "Disabled"
			boid.draw_gizmos_recursive(false)
	
