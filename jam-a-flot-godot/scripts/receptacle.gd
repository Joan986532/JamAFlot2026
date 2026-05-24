extends Area3D
@onready var game_manager: Node = %game_manager

func _on_body_entered(body: Node3D) -> void:
	Global.score += 1

func _on_body_exited(body: Node3D) -> void:
	Global.score -= 1
