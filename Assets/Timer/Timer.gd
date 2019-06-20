extends Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var temps = 0
var mm = 0
var ss = 0
var ms = 0
var prettyTime = ''
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var finish = get_node("../GridMap/Arrive/Area_Finish").finished
	if (self.get_time_left() == 0) and (finish == false):
		self.start(0.1)	# conteur toute les  100ms
		temps += 1
		printTime()
		#print(temps)
		###
		#Affichage du temps sur le HUD
		var timeLabel = get_node("../GridMap/Player/HUD/Temps")
		timeLabel.set_text(prettyTime)

func printTime():

	ms += 10
	
	if ms >= 100:
		ms = 0
		ss += 1
		if ss >= 60:
			ss = 0
			mm += 1

	prettyTime = ("Temps : " + str(mm) + ":" + str(ss) + ":" + str(ms))
		
	
