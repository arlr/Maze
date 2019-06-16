extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravity = -9.81
var velocity = Vector3()
var hitCount = get_slide_count()

export var poid_g = 10
export var jump_Force = 10


const SPEED = 15
const ACCELERATION = 6
const DE_ACCELERATION = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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
	
		
	#dir.y = 1
	dir = dir.normalized()
	dir = dir * SPEED * delta
	
	velocity.y += gravity * delta * poid_g
	velocity.x = dir.x * SPEED
	velocity.z = dir.z * SPEED
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))	#deplacement tant que l'on ne rencontre pas d'objet
	
	if is_on_floor() and Input.is_action_pressed("ui_accept"):
		velocity.y += jump_Force

	if hitCount > 0:
		var collision = get_slide_collision(0)
		if collision.collider is RigidBody:
			collision.collider.applt_implulse(collision.position, -collision.normal)