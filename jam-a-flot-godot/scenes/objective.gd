extends Label

var default_text = "Objects collected: "

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var obj = str(default_text, str(Global.score), "/6")
	self.text = (obj)
