extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravity = -9.81
var velocity = Vector3()
var hitCount = get_slide_count()
var mouse_motion = Vector2()

export var poid_g = 5
export var jump_Force = 30
#mouse sensitivity
export(float,0.1,1.0) var sensitivity_x = 0.5
export(float,0.1,1.0) var sensitivity_y = 0.4

const SPEED = 15
const ACCELERATION = 6
const DE_ACCELERATION = 5

onready var player_cam = $Camera

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	
	rotate_y(deg2rad(20)* - mouse_motion.x * sensitivity_x * delta)
	player_cam.rotate_x(deg2rad(20) * - mouse_motion.y * sensitivity_y * delta)
	player_cam.rotation.x = clamp(player_cam.rotation.x, deg2rad(-47), deg2rad(47))
	mouse_motion = Vector2()
	
	velocity = _axis() * SPEED
	#velocity.y = gravity
	velocity.y += gravity * delta * poid_g
		
	velocity = move_and_slide(velocity, Vector3(0,1,0))	#deplacement tant que l'on ne rencontre pas d'objet
	
	if hitCount > 0:
		var collision = get_slide_collision(0)
		if collision.collider is RigidBody:
			collision.collider.applt_implulse(collision.position, - collision.normal)
			
func _axis():
	var direction = Vector3()
	
	if Input.is_action_pressed("ui_up"):
		direction -= get_global_transform().basis.z.normalized()
		
	if Input.is_action_pressed("ui_down"):
		direction += get_global_transform().basis.z.normalized()
		
	if Input.is_action_pressed("ui_left"):
		direction -= get_global_transform().basis.x.normalized()
		
	if Input.is_action_pressed("ui_right"):
		direction += get_global_transform().basis.x.normalized()
		
	return direction.normalized()
	
func _input(event):
	
	if event is InputEventMouseMotion:
		mouse_motion = event.relative
		