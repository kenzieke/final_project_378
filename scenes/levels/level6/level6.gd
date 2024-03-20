extends Node2D

@onready var flying_dante = $FlyingDante
@onready var ground = $Ground
@export var fire_scene : PackedScene
@onready var fire_timer = $FireTimer
#const FIRE = preload("res://scenes/levels/level6/objects/fire.tscn")	

var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : int = 4
var screen_size : Vector2i
var ground_height : int
var pipes : Array 
const FIRE_DELAY : int = 100
const FIRE_RANGE : int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	ground_height = ground.get_node("Sprite2D").texture.get_height()
	new_game()

func new_game():
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	pipes.clear()
	generate_pipes()
	flying_dante.reset()
	
func _input(event):
	if game_over == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if game_running == false:
					start_game()
				else:
					if flying_dante.flying:
						flying_dante.flap()
						fire_timer.start()

func start_game():
	game_running = true
	flying_dante.flying = true
	flying_dante.flap()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_running:
		scroll += SCROLL_SPEED
		if scroll >= screen_size.x:
			scroll = 0
		ground.position.x = -scroll # move ground
		for pipe in pipes:
			pipe.position.x -= SCROLL_SPEED


func _on_fire_timer_timeout():
	generate_pipes()
	
func generate_pipes():
	var pipe = fire_scene.instantiate()
	pipe.position.x = screen_size.x + FIRE_DELAY
	pipe.position.y = (screen_size.y - ground_height) / 2 + randi_range(-FIRE_RANGE, FIRE_RANGE)
	pipe.hit.connect(dante_hit)
	add_child(pipe)
	pipes.append(pipe)

func dante_hit():
	pass
