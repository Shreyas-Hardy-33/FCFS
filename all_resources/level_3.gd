extends Node


var entered= false
var total_time_in_seconds : int = 0

func _ready()-> void:
	$PT_BT3.start()
	global.last_boss = true
	
func _on_cliffside_transition_point_body_entered(body: Node2D) -> void:
	if body.has_method('player'):
		entered=true
	
func _process(delta):
	if entered and global.last_boss_killed:
		
		global.CT3 = global.current_time
		global.TAT3 = global.CT3 - global.AT3
		global.WT3 = global.TAT3 - global.BT3
		
		global.phealth=200
		get_tree().change_scene_to_file("res://all_resources/end_scene.tscn")


func _on_pt_bt_3_timeout() -> void:
	$CURRENT_TIME.text = 'current_time : %d'% [int(global.current_time)]
	total_time_in_seconds  += 1
	var m = int((total_time_in_seconds)/60.0)
	var s= (total_time_in_seconds) - m * 60
	$P1_BT3_label.text = 'burst_time : '  + '%02d:%02d' % [m,s]
	global.BT3 = total_time_in_seconds
	
