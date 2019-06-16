extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_parent().name)
	print(get_parent().get_parent().name)
	print(get_parent().get_parent().get_parent().name)
	print(get_parent().get_parent().get_parent().get_parent().name)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Fonction pour faire tourner l'objet
	rotate_y(deg2rad(90 *delta)) 	#Godot utilise des radian pour mesurer les angles
	


func _on_Area_body_entered(body):
	if body is KinematicBody:
		var counter = get_parent().get_parent().get_parent().counterPill #Recupère le nombre de pill déjà collecter dans la variable global du niveau
		var LabelCounter = get_node("../../Player/HUD/NombrePill")
		counter += 1
		get_parent().get_parent().get_parent().counterPill = counter
		print(counter)
		print("Collect 1 Pill")
		LabelCounter.set_text("NB Pill : "+str(counter))
		queue_free()
