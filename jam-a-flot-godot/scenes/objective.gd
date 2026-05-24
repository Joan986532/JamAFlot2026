extends Label

var default_text = "Objects collectd: "

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var text = str(default_text, str(Global.score), "/6")
	self.text = (text)
