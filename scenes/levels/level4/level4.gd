extends Node2D

@onready var winsize = get_viewport().get_visible_rect().size
@onready var target = $Target
@onready var bad_target = $BadTarget
@onready var target_size = $Target/CollisionShape2D.shape.size
@onready var wait_timer = $TargetSpawner
@onready var respawn_timer = $Target/RespawnTimer
@onready var bad_timer = $BadTargetSpawner
@export var HOARDAXIA_POST_GAME = preload("res://scenes/levels/level4/dialogue_level4/hoardaxia_post_game.tscn") as PackedScene
var mouse_targeted_target = false
var mouse_targeted_bad_target = false
var lives = 3
var wins = 0
var total_targets = 15
var spawned_targets = -1
var target_alive = false
var bad_target_alive = false
const REQUIRED_ACCURACY = 75

func _ready():
	pass
	
func _process(delta):
	if (spawned_targets >= total_targets):
		var accuracy = (float(wins) / float(total_targets)) * 100.0
		print("GAME OVER! Accuracy: ", accuracy)
		respawn_timer.stop()
		wait_timer.stop()
		bad_timer.stop()
		target.position = Vector2i(-100, -100)
		bad_target.position = Vector2i(-100, -100)
		if (accuracy >= REQUIRED_ACCURACY):
			get_tree().change_scene_to_packed(HOARDAXIA_POST_GAME)
		else: # didn't meet accuracy requirement, restart level
			restart_level()
		return
	elif (lives <= 0):
		restart_level()
	else: # game still going
		if (!target_alive): # start spawning of target
			print("starting timer")
			wait_timer.wait_time = randf_range(0.2, 1.2)
			wait_timer.start()
			target_alive = true
		if (!bad_target_alive): # start spawning of abd target
			bad_timer.wait_time = randf_range(2.0, 5.0)
			bad_timer.start()
			bad_target_alive = true

func _spawn_target():
	spawned_targets += 1
	target.position = get_new_target_pos()
	target_alive = true
	respawn_timer.wait_time = randf_range(3.0, 4.0)
	respawn_timer.start()

func _spawn_bad_target():
	var new_pos = get_new_target_pos()
	bad_target.position = new_pos
	bad_target_alive = true

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and (mouse_targeted_target or mouse_targeted_bad_target):
			var new_pos = get_new_target_pos()
			if (mouse_targeted_target): # good target
				target.position = Vector2i(-100, -100)
				wins += 1
				target_alive = false
			elif (mouse_targeted_bad_target): # bad target
				bad_target.position = Vector2i(-100, -100)
				lives -= 1
				print("Don't kill friendlies! Lives: ", lives)

func get_new_target_pos():
	var pos = Vector2(randi_range(target_size.x, winsize.x - (target_size.x * 1.8)), randi_range(target_size.y, winsize.y - (target_size.y * 1.8)))
	#print("gen'd pos ", pos)
	return pos

func restart_level():
	print("YOU LOST!")
	lives = 3
	wins = 0
	spawned_targets = 0
	target_alive = false
	bad_target_alive = false
	get_tree().reload_current_scene()

func _on_target_mouse_entered():
	mouse_targeted_target = true

func _on_target_mouse_exited():
	mouse_targeted_target = false

func _on_bad_target_mouse_entered():
	mouse_targeted_bad_target = true

func _on_bad_target_mouse_exited():
	mouse_targeted_bad_target = false
