extends Area3D

@onready var game_manager: Node = $"../../game_manager"
@onready var sword_valid: TextureRect = game_manager.get_node("SwordValid")
@onready var bouclier_valid: TextureRect = game_manager.get_node("BouclierValid")
@onready var couronne_valid: TextureRect = game_manager.get_node("CouronneValid")
@onready var telephone_valid: TextureRect = game_manager.get_node("TelephoneValid")
@onready var bouteille_valid: TextureRect = game_manager.get_node("BouteilleValid")
@onready var vape_valid: TextureRect = game_manager.get_node("VapeValid")


func _on_body_entered(body: Node3D) -> void:
	if(body.name.begins_with("SP")):
		Global.score += 1
		
	if(body.name.begins_with("SP_epee")):
		sword_valid.visible = true
	if(body.name.begins_with("SP_bouclier")):
		bouclier_valid.visible = true
	if(body.name.begins_with("SP_couronne")):
		couronne_valid.visible = true
	if(body.name.begins_with("SP_vape")):
		vape_valid.visible = true
	if(body.name.begins_with("SP_jack_daniels")):
		bouteille_valid.visible = true
	if(body.name.begins_with("SP_telephone")):
		telephone_valid.visible = true
	

func _on_body_exited(body: Node3D) -> void:
	if(body.name.begins_with("SP")):
		Global.score -= 1
		
	if(body.name.begins_with("SP_epee")):
		sword_valid.visible = false
	if(body.name.begins_with("SP_bouclier")):
		bouclier_valid.visible = false
	if(body.name.begins_with("SP_couronne")):
		couronne_valid.visible = false
	if(body.name.begins_with("SP_vape")):
		vape_valid.visible = false
	if(body.name.begins_with("SP_jack_daniels")):
		bouteille_valid.visible = false
	if(body.name.begins_with("SP_telephone")):
		telephone_valid.visible = false
