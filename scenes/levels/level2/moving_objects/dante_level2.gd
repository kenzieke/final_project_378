extends Area2D

signal hit
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@onready var animatable_body_2d = $AnimatableBody2D
@onready var collision_shape_2d = $CollisionShape2D


func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		animatable_body_2d.play()
	else:
		animatable_body_2d.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		animatable_body_2d.animation = "walking" # need to add walking up and down and side to side
		animatable_body_2d.flip_v = false
		# See the note below about boolean assignment.
		#animatable_body_2d.flip_h = velocity.x < 0
		if velocity.x < 0:
			animatable_body_2d.flip_h = true
		else:
			animatable_body_2d.flip_h = false
	elif velocity.y != 0:
		animatable_body_2d.animation = "walking_up"
		#animatable_body_2d.flip_v = velocity.y > 0
		if velocity.y > 0:
			animatable_body_2d.animation = "walking_down"



func _on_body_entered(body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	collision_shape_2d.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
