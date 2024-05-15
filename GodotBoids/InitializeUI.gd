extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var all_nodes = get_tree().root.find_children("*", "", true)
	
	for node in all_nodes:
		if node.is_in_group("Player"):
			player_speed = node.SPEED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
