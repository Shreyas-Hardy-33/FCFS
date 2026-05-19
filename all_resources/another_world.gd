extends Node2D

var entered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_cliffside_transition_point_body_entered(body: Node2D) -> void:
	if body.has_method('player'):
		entered=true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered and global.golems_killed>=5:
		get_tree().change_scene_to_file("res://all_resources/transition_l2l_3.tscn")
		global.phealth=200
