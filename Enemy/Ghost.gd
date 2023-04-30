extends KinematicBody

var Player = null
var health = 3

var velocity = Vector3()
var gravity = -9.8
var speed = 1
var max_speed = 8

func _physics_process(_delta):
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		look_at(Player.global_transform.origin, Vector3.UP)
	velocity.y += gravity * _delta
	var falling = velocity.y
	velocity.y = 0
	
	var desired_velocity = Vector3()
	desired_velocity -= global_transform.basis.z
	#print(desired_velocity)
	if desired_velocity.length():
		velocity += desired_velocity
	else:
		velocity *= 0.9
	var current_speed = velocity.length()
	velocity = velocity.normalized() * clamp(current_speed,0,max_speed)
	velocity.y = falling
	velocity = move_and_slide(velocity, Vector3.UP, true)
	#print(velocity)

func damage():
	health -= 1
	$Hit.play()
	if health <= 0:
		die()

func die():
	hide()
	$CollisionShape.disabled = true
	$Die.play()
	Global.update_score(50)
	$Dying.start()


func _on_Dying_timeout():
	queue_free()
