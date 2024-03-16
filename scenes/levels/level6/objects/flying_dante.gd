extends CharacterBody2D

@onready var dante_flying = $AnimatedSprite2D

const GRAVITY : int = 1000
const MAX_VELOCITY : int = 600
const JET_SPEED : int = -500
var flying : bool = false
var falling : bool = false
const START_POS = Vector2(100, 400)

func _ready():
	reset()
	
func reset():
	falling = false
	flying = false
	position = START_POS
	set_rotation(0)

func _physics_process(delta):
	if flying or falling:
		velocity.y += GRAVITY * delta
		if velocity.y > MAX_VELOCITY:
			velocity.y = MAX_VELOCITY
		if flying:
			set_rotation(deg_to_rad(velocity.y * 0.05))
			dante_flying.animation == "jet"
			dante_flying.play()
		elif falling:
			set_rotation(PI/2)
			dante_flying.stop()
		move_and_collide(velocity * delta)
	else:
		dante_flying.stop()
		
func flap():
	dante_flying.animation == "jet" # not working
	velocity.y = JET_SPEED
