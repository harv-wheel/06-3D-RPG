extends Spatial

var Ghost = null

func _ready():
	Ghost = load("res://Enemy/Ghost.tscn")
	#spawn_ghost()

func spawn_ghost():
	$SpawnTimer.start()


func _on_SpawnTimer_timeout():
	#print("timer started")
	var ghost = Ghost.instance()
	ghost.translation.x = 22
	ghost.translation.y = 36
	ghost.translation.z = -22
	add_child(ghost)
	#print("timer stopped")
	$SpawnTimer.start()
	
