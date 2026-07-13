extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$P1_scores/VBoxContainer/AT1.text = "Arrival Time: %d" % [global.AT1]
	$P1_scores/VBoxContainer/BT1.text = "Burst Time: %d" % [global.BT1]
	$P1_scores/VBoxContainer/CT1.text = "Completion Time: %d" % [global.CT1]
	$P1_scores/VBoxContainer/TAT1.text = "Turnaround Time: %d" % [global.TAT1]
	$P1_scores/VBoxContainer/WT1.text = "Waiting Time: %d" % [global.WT1]

	$P2_scores/VBoxContainer/AT2.text = "Arrival Time: %d" % [global.AT2]
	$P2_scores/VBoxContainer/BT2.text = "Burst Time: %d" % [global.BT2]
	$P2_scores/VBoxContainer/CT2.text = "Completion Time: %d" % [global.CT2]
	$P2_scores/VBoxContainer/TAT2.text = "Turnaround Time: %d" % [global.TAT2]
	$P2_scores/VBoxContainer/WT2.text = "Waiting Time: %d" % [global.WT2]

	$P3_scores/VBoxContainer/AT3.text = "Arrival Time: %d" % [global.AT3]
	$P3_scores/VBoxContainer/BT3.text = "Burst Time: %d" % [global.BT3]
	$P3_scores/VBoxContainer/CT3.text = "Completion Time: %d" % [global.CT3]
	$P3_scores/VBoxContainer/TAT3.text = "Turnaround Time: %d" % [global.TAT3]
	$P3_scores/VBoxContainer/WT3.text = "Waiting Time: %d" % [global.WT3]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_exit_pressed() -> void:
	get_tree().quit() # Replace with function body.
