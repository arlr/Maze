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
	var name_save = str(lvl) + "_save.txt"
	var contenu = []
	var text = str(contenu) + "_" + str(score)
	print_debug(lvl)
	print_debug("res://Saves/"+name_save)
	save.open("res://Saves/"+name_save, File.READ_WRITE)
	contenu = save.get_csv_line("$")
	contenu.append(text)
	print_debug(text)
	save.store_csv_line(text,"$")
	save.close()
	

	
	