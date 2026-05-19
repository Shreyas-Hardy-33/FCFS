extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_resume_2_pressed():
	get_tree().change_scene_to_file('res://all_resources/another_world.tscn')


func _on_restart_2_pressed() -> void:
	get_tree().change_scene_to_file('res://all_resources/world.tscn') 
