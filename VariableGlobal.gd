extends Node

# https://docs.godotengine.org/en/3.1/getting_started/step_by_step/singletons_autoload.html#custom-scene-switcher
var current_scene = null
# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
