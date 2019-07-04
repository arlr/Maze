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

func _on_Retour_pressed():
	VariableGlobal._deferred_goto_scene("res://Menus/Main_Menu/MainMenu.tscn")


func _on_Lv1_pressed():
	VariableGlobal._deferred_goto_scene("res://Levels/Level1/Level1.tscn")


func _on_Lv2_pressed():
	VariableGlobal._deferred_goto_scene("res://Levels/Level2/Level2.tscn")


func _on_Lv3_pressed():
	VariableGlobal._deferred_goto_scene("res://Levels/Level3/Level3.tscn")
