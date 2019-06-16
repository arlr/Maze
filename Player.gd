extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravity = -9.81
var velocity = Vector3()
var camera

const SPEED = 15
const ACCELERATION = 6
const DE_ACCELERATION = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_node("../Camera").get_global_transform()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var dir = Vector3()
	if Input.is_action_pressed("ui_right"):
		dir.x +=1
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		dir.z += 1
	if Input.is_action_pressed("ui_up"):
		dir.z -= 1
		
	dir.y = 0
	dir = dir.normalized()
	
	velocity.y += delta * gravity
	
	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * SPEED
	var accel = DE_ACCELERATION
		
	if (dir.dot(hv) > 0):
		accel = ACCELERATION
	
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(1,1,1))
		