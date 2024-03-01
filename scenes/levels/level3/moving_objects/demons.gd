extends CharacterBody2D


const SPEED = 300.0
var motion = Vector2()
@onready var bat = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	bat.flip_h = true
	
	var DanteLevel3 = get_parent().get_node("DanteLevel3")
	position += (DanteLevel3.position - position)/100
	look_at(DanteLevel3.position)
	

	move_and_collide(motion)

# not working
func _on_area_2d_body_entered(body):
	if "PieBullets" in body.name:
		queue_free()
