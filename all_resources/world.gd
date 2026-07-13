extends Node


var entered= false

var total_time_in_seconds :int = 0 

func _ready() -> void:
	$P1_BT1.start()

	
func _on_cliffside_transition_point_body_entered(body: Node2D) -> void:
	if body.has_method('player'):
		entered=true
	
func _process(delta):
	if entered and global.enemies_killed>=3:
		global.CT1 = global.current_time
		global.TAT1 = global.CT1 - global.AT1
		global.WT1 = global.TAT1 - global.BT1 
		
		if(global.current_time<global.AT2):
			global.phealth=200
			get_tree().change_scene_to_file("res://all_resources/idle_screen2.tscn")
		else:
			get_tree().change_scene_to_file("res://all_resources/another_world.tscn")
			global.phealth=200
		


func _on_p_1_bt_1_timeout() -> void:
	$CURRENT_TIME.text = 'Current_time : %d'% [int(global.current_time)]
	total_time_in_seconds  += 1
	var m = int((total_time_in_seconds)/60.0)
	var s= total_time_in_seconds - m * 60
	$P1_BT1_label.text = 'burst_time : '  + '%02d:%02d' % [m,s]
	global.BT1 = total_time_in_seconds
