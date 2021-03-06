extends Node

var time_lvl = [0,0,0]
var list_lvl = []
# https://docs.godotengine.org/en/3.1/getting_started/step_by_step/singletons_autoload.html#custom-scene-switcher
onready var current_scene = null
onready var old_scene = null
var Level = null
var Nb_Level = 0
var actual_lvl = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)
	level_counter()	#Compte automatiquement le nombre de niveaux
	actual_lvl = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	
	old_scene = current_scene.filename	#Réupère le chemain de la scene actuel à utiliser pour les boutons retour
	print_debug(" Old scene = " + str(old_scene)) 
	# It is now safe to remove the current scene
	current_scene.queue_free()	#https://godotengine.org/qa/4062/freeing-objects-nodes

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instance()
	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)
	print_debug("Current scene = " + str(current_scene))

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		print_debug("current scene = " + str(current_scene.filename))
		if current_scene.filename != "res://Menus/Main_Menu/MainMenu.tscn" and  current_scene.filename != "res://Menus/LevelSelector/LevelSelector.tscn" and current_scene.filename != "res://Menus/Options/OptionMenu.tscn" and current_scene.filename != "res://Menus/Options/Touches/Affectation_touhes.tscn" and current_scene.filename != "res://Menus/FinDePartie/FinDePartie.tscn":
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			#Level = current_scene.filename
			#var PauseMenu = get("res://Menus/Echape/Escape_Menu.tscn")
			#print(PauseMenu)
			
			get_tree().paused = true
			var PauseMenu = preload("res://Menus/Echape/Escape_Menu.tscn")
			var PauseMenuNode = PauseMenu.instance()
			add_child(PauseMenuNode)
			PauseMenuNode.show()
			print(PauseMenuNode)
			#PauseMenu.visible = pause*
		
func level_counter():
	"""
	@bref Compte automatiquement le nombre de niveau dans le jeu
	"""
	var path = "res://Levels"
	list_lvl = []
	var dir = Directory.new()
	var nb_folder = 0
	if dir.open(path) == OK:
		print_debug("Comptage du nombre de Niveaux")
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
			if dir.current_is_dir() and file_name.begins_with("Lev"):	#Compte le nombre de fichier commençant par "Lev"
				nb_folder += 1
				print_debug(file_name)
				list_lvl.append(file_name)
			file_name = dir.get_next()
		
	else:
		print_debug("An error occurred when trying to access the path.")
	list_lvl.sort()	#trie le tableau par ordre alphabetique
	Nb_Level = nb_folder
	print_debug("Liste level : " + str(list_lvl) + " | Nb de Level : " + str(Nb_Level) )
		
