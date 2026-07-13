extends Control




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_at_1_text_submitted(new_text: String) -> void:
	global.AT1 = new_text.to_int()

func _on_at_2_text_submitted(new_text: String) -> void:
	global.AT2 = new_text.to_int()


func _on_at_3_text_submitted(new_text: String) -> void:
	global.AT3 = new_text.to_int() 


func _on_continue_pressed() -> void:
	if(global.AT1!=-1 and global.AT2!=-1 and global.AT3!=-1 and global.AT1<global.AT2 and global.AT1<global.AT3 and global.AT2<global.AT3):
		if(global.AT1>global.current_time):
			get_tree().change_scene_to_file("res://all_resources/IDLE_SCREEN.tscn")
		else:
			get_tree().change_scene_to_file("res://all_resources/world.tscn")
	else:
		$Warning.text = "Enter numbers more than -1 in input fields , in ascending order and press enter"
