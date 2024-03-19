extends Node2D

@onready var faller_timer = $FallingObject/FallingTimer
@onready var move_timer = $Player/MoveTimer
@onready var faller = $FallingObject
@onready var player = $Player
@onready var window_size = get_viewport_rect().size

const INIT_SPEED = 50
var target_speed = INIT_SPEED
var accel = 700
var current_lane = 0
var target_lane = 0
var lane_positions = []
var player_may_move = true
var points = 0
@onready var target_catch_offset = $Player/CollisionShape2D.shape.extents.y

func player_moved():
	player_may_move = false
	move_timer.start()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	faller_timer.start()
	var offset = window_size.x / 5
	lane_positions = [offset, offset * 2, offset * 3, offset * 4]
	
func _input(event):
	if player_may_move:
		if Input.is_action_pressed("right"):
			if (current_lane < 3):
				player_moved()
				current_lane += 1
		if Input.is_action_pressed("left"):
			if (current_lane > 0):
				player_moved()
				current_lane -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player.position.x = lane_positions[current_lane]
	
	target_speed += accel * delta
	faller.position.y += target_speed * delta
	faller.position.x = lane_positions[target_lane]
	
	if current_lane == target_lane:
		if faller.position.y < player.position.y:
			faller.position.y = clamp(faller.position.y, 0, player.position.y + target_catch_offset)
			
		if faller.position.y >= player.position.y and faller.position.y < player.position.y + target_catch_offset:
			target_fell(true)

func _on_falling_timer_timeout():
	target_fell(false)

func target_fell(caught):
	if caught and current_lane == target_lane:
		points += 1
		
	print(points)
	faller.position.y = 0
	target_speed = INIT_SPEED
	target_lane = randi_range(0, 3)
	faller_timer.start()

func _on_move_timer_timeout():
	player_may_move = true
