extends Node


var entered= false


func _on_cliffside_transition_point_body_entered(body: Node2D) -> void:
	if body.has_method('player'):
		entered=true
	
func _process(delta):
	if entered and global.last_boss_killed:
		global.phealth=200
		get_tree().change_scene_to_file("res://all_resources/end_scene.tscn")
