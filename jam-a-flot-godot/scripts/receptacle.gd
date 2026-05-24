extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if (body.name.begins_with("SP")):
		Global.score += 1

func _on_body_exited(body: Node3D) -> void:
	if (body.name.begins_with("SP")):
		Global.score -= 1
