extends AudioStreamPlayer2D
const level_music = preload("res://all_resources/The Last of Us Part II (Main Theme) The Last of Us Part II (Original Soundtrack).mp3")



func play_music(music : AudioStream,volume =0.0):
	if stream==music:
		return
		
	stream=music
	
	
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
