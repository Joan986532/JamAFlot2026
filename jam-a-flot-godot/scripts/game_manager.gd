extends Node

@onready var time_left: Label = $timeLeft
@onready var failed: Label = $Failed
@onready var to_restart: Label = $toRestart
@onready var timer: Timer = $Timer

var time : int = 180

func set_values():
		failed.hide()
		to_restart.hide()
		time = 15
		timer.start()
 
func _ready():
	set_values()

func _on_timer_timeout() -> void:
	time -= 1
	var m = int(time / 60)
	var s = time - m * 60
	time_left.text = '%02d:%02d' % [m, s]
	if time == 0:
		timer.stop()
		failed.show()
		to_restart.show()

func _process(delta: float) -> void:
	if time == 0 && Input.is_action_just_pressed("restart"):
		set_values()
		time_left.text = ""
		get_tree().reload_current_scene()
