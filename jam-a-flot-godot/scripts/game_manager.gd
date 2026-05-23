extends Node

var score = 0
@onready var label: Label = $Label

func add_point():
	score += 1
	label.text = "Objects collected: " + str(score) + "/6"

func remove_point():
	score -= 1
	label.text = "Objects collected: " + str(score) + "/6"
