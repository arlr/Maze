extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var finished = false
# Called when the node enters the scene tree for the first time.
func _ready():
#	print(get_parent().name)
#	print(get_parent().get_parent().name)
	#print(get_parent().get_parent().get_parent().name)
	#print(get_parent().get_parent().get_parent().get_parent().name)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_Finish_body_entered(body):
	if body is KinematicBody:
		if get_parent().get_parent().get_parent().counterPill == get_parent().get_parent().get_parent().nb_LevelPill:
			get_parent().get_parent().get_parent().get_node("Timer").set_autostart(false)
			finished = true
			affiche_fin()
			print("WIN")


func affiche_fin():
	print_debug(VariableGlobal.actual_lvl)
	var Fin_Menu = preload("res://Menus/FinDePartie/FinDePartie.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var Fin_MenuNode = Fin_Menu.instance()
	add_child(Fin_MenuNode)
	Fin_MenuNode.show()