extends Node2D


# Called when the node enter

func _on_button_pressed() -> void:
	await get_tree().create_timer(10.0).timeout
	get_tree().change_scene_to_file('res://all_resources/level_3.tscn')


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file('res://all_resources/menu.tscn')
