extends Control

#Source https://www.gotut.net/godot-key-bindings-tutorial/

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_keys()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var can_change_key = false
var action_string
enum ACTIONS {ui_up, ui_down, ui_left, ui_right}
  
func _set_keys():
	for j in ACTIONS:
		get_node("VBoxContainer/HBoxContainer_" + str(j) + "/Button_" + str(j)).set_pressed(false)
		if !InputMap.get_action_list(j).empty():
			print_debug((" Bouton " + str(j) + " text : " + str(InputMap.get_action_list(j)[0])))
			print_debug(" $$$$ List " + str(j) + " = " + str(InputMap.get_action_list(j)))
			get_node("VBoxContainer/HBoxContainer_" + str(j) + "/Button_" + str(j)).set_text(InputMap.get_action_list(j)[0].as_text())
		else:
			get_node("VBoxContainer/HBoxContainer_" + str(j) + "/Button_" + str(j)).set_text("No Button!")

func _mark_button(string):
	print_debug("mark button str = " + string)
	can_change_key = true
	action_string = string
	
	for j in ACTIONS:
		if j != string:
			get_node("VBoxContainer/HBoxContainer_" + str(j) + "/Button_" + str(j)).set_pressed(false)

func _input(event):
	if event is InputEventKey:
		print_debug("Can change key : " + str(can_change_key))
		if can_change_key:
			_change_key(event)
			can_change_key = false

func _change_key(new_key):
	print_debug("CHANGE KEY FUNC")
	#Delete key of pressed button
	print_debug("New key = " + str(new_key))
	if !InputMap.get_action_list(action_string).empty():
		InputMap.action_erase_event(action_string, InputMap.get_action_list(action_string)[0])

	#Check if new key was assigned somewhere
	for i in ACTIONS:
		if InputMap.action_has_event(i, new_key):
			InputMap.action_erase_event(i, new_key)

	#Add new Key
	print_debug(" --------- Action string = " + str(action_string))
	print_debug(" +++++++++ New key = " + str(new_key))
	print_debug( typeof(new_key))
	InputMap.action_add_event(action_string, new_key)
	_set_keys()

func _on_Button_ui_up_pressed():
	_mark_button("ui_up")

func _on_Button_ui_down_pressed():
	_mark_button("ui_down")

func _on_Button_ui_left_pressed():
	_mark_button("ui_left")

func _on_Button_ui_right_pressed():
	_mark_button("ui_right")

func _on_Retour_pressed():
	VariableGlobal._deferred_goto_scene(VariableGlobal.old_scene)