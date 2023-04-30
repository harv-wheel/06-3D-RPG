extends Spatial


func _ready():
	$Area/CollisionShape.disabled = true



func _on_Area_body_entered(_body):
	Global.update_score(1000)
	get_tree().change_scene("res://UI/Win.tscn")

func enable():
	$Area/CollisionShape.disabled = false
