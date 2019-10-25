extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug("_ready Levelselector")
	var node = get_node("VBoxContainer/GridContainer")
	print_debug(get_node("VBoxContainer/GridContainer").get_children())
	for nb in range(VariableGlobal.Nb_Level):
		var bp_name = "LV "+str(nb+1)
		print("LV "+str(nb+1))
		# Setup the button
		var bp = Button.new()
		bp.name = bp_name
		bp.text = bp_name
		bp.flat = true
		bp.rect_min_size = Vector2(130, 130)
		bp.ACTION_MODE_BUTTON_PRESS
		bp.add_font_override("font", load("res://Fonts/Menu_FontDynamic.tres"))
		bp.connect("pressed", self , "_on_autoBp_pressed", [bp])
		#bg.("pressed",self, "_on_autoBp_pressed")
		print_debug(bp.name)
		
	
		
		node.add_child(bp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Retour_pressed():
	VariableGlobal._deferred_goto_scene(VariableGlobal.old_scene)

func _on_autoBp_pressed(target):
	#Basic function for every automaticly created button 
	print_debug("In pressed func")
	var name_target = target.get_name()
	print_debug(name_target.split(' ')[1].replace(' ', ''))
	
	var scene_target = "Level" + name_target.split(' ')[1].replace(' ', '') 
	print_debug("scene target = " + scene_target)
	
	var path_scene_target = "res://Levels/" + scene_target + "/" + scene_target +".tscn"
	VariableGlobal._deferred_goto_scene(path_scene_target)
	VariableGlobal.actual_lvl = int(name_target.split(' ')[1].replace(' ', ''))