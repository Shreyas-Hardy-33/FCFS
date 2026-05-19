extends Node2D


func _on_start_pressed():
	get_tree().change_scene_to_file('res://all_resources/world.tscn')
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_link_button_pressed():
	OS.shell_open('https://www.geeksforgeeks.org/states-of-a-process-in-operating-systems/')
	# Replace with function body.eplace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
