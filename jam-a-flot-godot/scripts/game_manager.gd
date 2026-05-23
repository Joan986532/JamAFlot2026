extends Node

var score = 0
@onready var objective: Label = $Objective
@onready var timer: Timer = $Timer
@onready var time_left: Label = $timeLeft
@onready var failed: Label = $Failed

var total_time : int = 180

func add_point():
	score += 1
	objective.text = "Objects collected: " + str(score) + "/6"

func remove_point():
	score -= 1
	objective.text = "Objects collected: " + str(score) + "/6"

func _on_timer_timeout() -> void:
	total_time -= 1
	var m = int(total_time / 60)
	var s = total_time - m * 60
	time_left.text = '%02d:%02d' % [m, s]
	if total_time == 0:
		timer.stop()
		failed.set_visibility_layer(1)
		get_tree().reload_current_scene()

