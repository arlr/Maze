extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_BP_ListeLvl_pressed():
	VariableGlobal.goto_scene("res://Menus/LevelSelector/LevelSelector.tscn")


func _on_BP_Options_pressed():
	VariableGlobal.goto_scene("res://Menus/Options/OptionMenu.tscn")

func _on_BP_Quitter_pressed():
	get_tree().quit()


