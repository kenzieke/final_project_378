extends Node2D

@onready var timer = $FallingObject/FallingTimer
@onready var faller = $FallingObject

const INIT_SPEED = 1
var speed = INIT_SPEED
var accel = 6

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed += accel
	faller.position.y += speed * delta


func _on_falling_timer_timeout():
	faller.position.y = 0
	speed = INIT_SPEED
