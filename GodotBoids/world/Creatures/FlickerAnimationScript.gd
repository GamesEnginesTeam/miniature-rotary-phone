extends AnimationPlayer

@onready
var anim: AnimationPlayer = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	play_default_animation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func play_default_animation():
	anim.play("Flicker")
