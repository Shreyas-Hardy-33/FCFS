extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if(get_tree().current_scene.name == 'menu' or get_tree().current_scene.name == 'Control'):
		
		global.current_time = 0   
	else:
		global.current_time += 1
		print(global.current_time)
			
