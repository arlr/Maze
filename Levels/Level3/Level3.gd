extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counterPill = 0
var nb_LevelPill = 0
var listChildGridMap
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	listChildGridMap = get_node("GridMap").get_children()
	for node in listChildGridMap:
		var nameNode = node.name
		if nameNode.begins_with("Pill"):
			nb_LevelPill += 1
	
