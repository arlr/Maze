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
		var bp_name = "LV "+str(nb+1)+" Perso"
		print("LV "+str(nb+1)+"Perso")
		var bp = Button.new()
		bp.name = bp_name
		bp.text = bp_name
		bp.flat = true
		bp.ACTION_MODE_BUTTON_PRESS
		
		node.add_child(bp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Retour_pressed():
	VariableGlobal._deferred_goto_scene(VariableGlobal.old_scene)

func _on_Lv1_pressed():
	VariableGlobal._deferred_goto_scene("res://Levels/Level1/Level1.tscn")
	VariableGlobal.actual_lvl = 1

func _on_Lv2_pressed():
	VariableGlobal._deferred_goto_scene("res://Levels/Level2/Level2.tscn")
	VariableGlobal.actual_lvl = 2

func _on_Lv3_pressed():
	VariableGlobal._deferred_goto_scene("res://Levels/Level3/Level3.tscn")
	VariableGlobal.actual_lvl = 3