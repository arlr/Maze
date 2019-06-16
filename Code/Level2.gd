extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var counterPill
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	counterPill = 12

func _input(event):
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
