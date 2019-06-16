extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Fonction pour faire tourner l'objet
	rotate_y(deg2rad(90 *delta)) 	#Godot utilise des radian pour mesurer les angles
	


func _on_Area_body_entered(body):
	if body is KinematicBody:
		print("Collect 1 Pill")
		queue_free()
