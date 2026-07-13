extends Node2D


var total_time_in_seconds : int = 0
var entered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$P1_BT2.start()# Replace with function body.

func _on_cliffside_transition_point_body_entered(body: Node2D) -> void:
	if body.has_method('player'):
		entered=true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered and global.golems_killed>=5:
		global.CT2 = global.current_time
		global.TAT2 = global.CT2 - global.AT2
		global.WT2 = global.TAT2 - global.BT2
		
		if(global.current_time<global.AT3):
			global.phealth= 200
			get_tree().change_scene_to_file("res://all_resources/idle_screen_3.tscn")
		
		else:
			get_tree().change_scene_to_file("res://all_resources/level_3.tscn")
			global.phealth=200


func _on_p_1_bt_2_timeout() -> void:
	$CURRENT_TIME.text = 'current_time : %d'% [int(global.current_time)]
	total_time_in_seconds += 1
	var m = int((total_time_in_seconds)/60.0) 
	var s = total_time_in_seconds  - m * 60 
	$P1_BT2_label.text = 'burst_time : '  + '%02d:%02d' % [m,s]
	global.BT2 = total_time_in_seconds
	
