extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS



func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('ui_cancel'):
		if get_tree().paused == false:
			get_tree().paused = true
			visible = true
		else:
			get_tree().paused = false
			visible = false 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false
