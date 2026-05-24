extends Node

@onready var time_left: Label = $timeLeft
@onready var failed: Label = $Failed
@onready var to_restart: Label = $toRestart
@onready var timer: Timer = $Timer
@onready var success: Label = $success

var time : int = 180

func set_values():
		failed.hide()
		success.hide()
		to_restart.hide()
		time = 180
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

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().change_scene_to_file("res://scenes/Titlescreen.tscn")
	if time == 0 and Input.is_action_just_pressed("restart"):
		set_values()
		time_left.text = ""
		get_tree().reload_current_scene()
	if Global.score == 6 and time != 0:
		timer.stop()
		success.show()
