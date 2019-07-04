extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var node = self
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func _on_BP_Continer_pressed():
	node.hide()
	node.queue_free()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().paused = false
	
func _on_BP_Quitter_pressed():
	get_tree().quit()

func _on_BP_Menu_pressed():
	node.hide()
	node.queue_free()
	get_tree().paused = false
	VariableGlobal.goto_scene("res://Menus/Main_Menu/MainMenu.tscn")
