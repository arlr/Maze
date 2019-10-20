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
	"""
	@brief : A l'appuis sur le bouton suivant Sauvegarde le score et redirige le joueru sur le niveau suivant
	"""
	print_debug("Jouer au niveau suivant")
	print_debug("Numero Level " + str(VariableGlobal.actual_lvl))
	#Sauvegarde
	var name_save = str(VariableGlobal.list_lvl[VariableGlobal.actual_lvl-1])
	Save.Save(name_save,NomJoueur,VariableGlobal.time_lvl)
	
	var next_lvl = VariableGlobal.list_lvl[VariableGlobal.actual_lvl]
	print_debug(next_lvl)
	next_lvl = "res://Levels/" + str(next_lvl) + "/" + str(next_lvl) + ".tscn"
	VariableGlobal.goto_scene(next_lvl)
	VariableGlobal.actual_lvl += 1
	if VariableGlobal.actual_lvl >= VariableGlobal.list_lvl.size():
		VariableGlobal.actual_lvl -= 1


func _on_Rejouer_pressed():
	"""
	@brief : A l'appuis sur le bouton "Rejouer" Sauvegarde le score et relance le niveau
	"""
	print_debug("Rejouer le niveau")
	print_debug("Numero Level " + str(VariableGlobal.actual_lvl))
	#Sauvegarde
	var name_save = str(VariableGlobal.list_lvl[VariableGlobal.actual_lvl-1])
	Save.Save(name_save,NomJoueur,VariableGlobal.time_lvl)
	
	var next_lvl = VariableGlobal.list_lvl[VariableGlobal.actual_lvl-1]	# -1 car actual leval est le numero du niveau en commençant à 1 & le premier indice de list_lvl est 0
	print_debug("Next LVL : "+ str(next_lvl))
	next_lvl = "res://Levels/" + str(next_lvl) + "/" + str(next_lvl) + ".tscn"
	VariableGlobal.goto_scene(next_lvl)

func _on_Nom_Joueur_text_entered(new_text):
	NomJoueur = new_text

func _on_Nom_Joueur_text_changed(new_text):
	NomJoueur = new_text
