extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var finished = false
# Called when the node enters the scene tree for the first time.
func _ready():
#	print(get_parent().name)
#	print(get_parent().get_parent().name)
#	print(get_parent().get_parent().get_parent().name)
#	print(get_parent().get_parent().get_parent().get_parent().name)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_Finish_body_entered(body):
	if body is KinematicBody:
		print("WIN")
		finished = true
		get_parent().get_parent().get_parent().get_node("Timer").set_autostart(false)
		#get_parent().get_parent().get_parent().get_node("Timer").set_one_shot(true)