extends Node2D

@export var knife_scene: PackedScene
var score
@onready var knife_timer = $KnifeTimer
@onready var score_timer = $ScoreTimer
@onready var start_timer = $StartTimer
@onready var start_position = $StartPosition
@onready var player = $DanteLevel2
@onready var knife_spawn_location = $KnifePath/KnifeSpawnLocation
@onready var hud = $Hud
@onready var knife_sounds = $KnifeSounds
const promise_end = preload("res://scenes/levels/level2/dialogue_scenes/promise_end.tscn")
const friend_end = preload("res://scenes/levels/level2/dialogue_scenes/friend_end.tscn")

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func game_over():
	score_timer.stop()
	knife_timer.stop()
	hud.show_game_over()
	knife_sounds.stop()

func new_game():
		score = 0
		player.start(start_position.position)
		start_timer.start()
		hud.update_score(score)
		hud.show_message("Get Ready")
		get_tree().call_group("knives", "queue_free")
		knife_sounds.play()

func _on_knife_timer_timeout():
	# Create a new instance of the Mob scene.
	var knife = knife_scene.instantiate()

	knife_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = knife_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	knife.position = knife_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	knife.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	knife.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(knife)

func _on_score_timer_timeout():
	score += 1
	hud.update_score(score)
	if score == 60:
		if global.promise_wrath == 1:
			get_tree().change_scene_to_packed(promise_end)
		elif global.friend_wrath == 1:
			get_tree().change_scene_to_packed(friend_end)

func _on_start_timer_timeout():
	knife_timer.start()
	score_timer.start()
