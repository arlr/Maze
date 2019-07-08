extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var NomJoueur = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	var Score = get_node("CanvasLayer/ColorRect/VBoxContainer/Temp")
	Score.set_text(str(VariableGlobal.time_lvl[0]) + ":" + str(VariableGlobal.time_lvl[1]) + ":" + str(VariableGlobal.time_lvl[2]))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Suivant_pressed():
	var next_lvl = VariableGlobal.list_lvl[VariableGlobal.actual_lvl + 1]
	print_debug(next_lvl)
	next_lvl = "res://Levels/" + str(next_lvl) + "/" + str(next_lvl) + ".tscn"
	Save.Save(next_lvl,NomJoueur,VariableGlobal.time_lvl)
	VariableGlobal.goto_scene(next_lvl)


func _on_Rejouer_pressed():
	
	var next_lvl = VariableGlobal.list_lvl[VariableGlobal.actual_lvl]
	print_debug(next_lvl)
	next_lvl = "res://Levels/" + str(next_lvl) + "/" + str(next_lvl) + ".tscn"
	Save.Save(next_lvl,NomJoueur,VariableGlobal.time_lvl)
	VariableGlobal.goto_scene(next_lvl)


func _on_Nom_Joueur_text_entered(new_text):
	NomJoueur = new_text
