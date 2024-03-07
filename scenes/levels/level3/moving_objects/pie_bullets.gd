extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bullet_area_area_entered(area):
	if "Demons" in area.name:
		queue_free()


func _on_timer_timeout():
	queue_free()

func _on_pie_bullets_body_entered(body):
	pass # Replace with function body.
