extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var affiche = false
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
#	print(get_parent().name)
#	print(get_parent().get_parent().name)
#	print(get_parent().get_parent().get_parent().name)
#	print(get_parent().get_parent().get_parent().get_parent().name)
#	print(get_parent().get_parent().get_parent().get_parent().get_parent().name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = 'FPS: ' + str(Engine.get_frames_per_second())
	if Input.is_action_just_pressed("FPS"):
		affiche =! affiche

	if affiche:
		self.show()
	else:
		self.hide()
