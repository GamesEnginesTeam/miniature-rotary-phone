extends Node3D

@export var anim: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	play_default_animation()

func play_default_animation():
	anim.play("Flight")
