extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TImeChecker.start()
		 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_t_ime_checker_timeout() -> void:
	print("AT : " , global.AT1)
	if(global.current_time==global.AT1):
		get_tree().change_scene_to_file("res://all_resources/world.tscn")
