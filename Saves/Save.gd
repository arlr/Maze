extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func Save(lvl,nom_joueur,score):
	var save = File.new()
	var name_save = str(lvl) + "_save.txt"	#Le nom du fichier de sauvegarde prend le numéro du niveau avec "_save.txt"
	var contenu = []
	var text = str(nom_joueur) + "_" + str(score)
	print_debug(lvl)
	print_debug("res://Saves/"+name_save)
	if save.file_exists("res://Saves/"+name_save) == true:	#Si le fichier existe on lit son contenu pour le réecrire en y ajoutant les nouvelles valeurs
		save.open("res://Saves/"+name_save, File.READ)
		contenu = save.get_csv_line("$")
		print_debug("fichier existe")
		save.close()
	
	save.open("res://Saves/"+name_save, File.WRITE)	#Vide le fichier et ecrit la liste des scores
	contenu.append(text)
	print_debug(text)
	save.store_csv_line(contenu,"$")
	save.close()
	

	
	