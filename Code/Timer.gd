extends Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var temps = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_parent().name)
	print(get_parent().get_parent().name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_time_left() == 0:
		self.start(0.1)	# conteur toute les  100ms
		temps += 1
		#printTime(temps)
		print(temps)
		###
		#Affichage du temps sur le HUD
		var timeLabel = get_node("../GridMap/Player/HUD/Temps")
		timeLabel.set_text(str(temps))

#func printTime(time):
#	var mm = 0
#	var ss = 0
#	var ms = 0
#
#	int(ms) = int(time)
#	if ms % 1:
#		ms = 0
#		ss += 1;
#		if ss % 60:
#			ss = 0
#			mm += 1
#
#	print("Temps : " + str(mm) + ":" + str(ss) + ":" + str(ms))
		
	
