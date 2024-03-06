extends Area2D

@onready var timer = $Timer

const INIT_SPEED = 1
var speed = INIT_SPEED
var accel = 6

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed += accel
	position.y += speed * delta

func _on_timer_timeout():
	position.y = 0
	speed = INIT_SPEED
	
	pass # Replace with function body.
