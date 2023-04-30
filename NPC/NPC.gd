extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")
onready var Spawns = get_node("/root/Game/Ghost_container/SpawnTimer")
onready var Gizmo = get_node("/root/Game/Gizmo")

var dialogue = [
	"Welcome to the Ghost Volcano. They call it that because it has ghosts in it. (Press E to continue)"
	,"If you're looking for the Ghost Gizmo, it's at the highest point on the island."
	,"The ghosts will probably try to stop you, but it looks like you have a Ghost Gun, so you'll be fine."
	,"Oh dang, looks like it's Ghost O' Clock. If you don't get the Ghost Gem in 1 minute, you'll end up a ghost too!"
	]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")


func _on_Area_body_entered(_body):
	print("Body Entered")
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(_body):
	Dialogue.hide_dialogue()

func finished():
	get_node("/root/Game/Ghost_container").show()
	Global.timer = 60
	Spawns.start()
	Gizmo.show()
	Gizmo.enable()
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
