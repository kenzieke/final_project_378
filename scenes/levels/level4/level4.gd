extends Node2D

@onready var winsize = get_viewport().get_visible_rect().size
@onready var target = $Target
@onready var bad_target = $BadTarget
@onready var target_size = $Target/CollisionShape2D.shape.size
var mouse_targeted_target = false
var mouse_targeted_bad_target = false
var lives = 3
var wins = 0

func get_new_target_pos():
	var pos = Vector2(randi_range(0, winsize.x - target_size.x), randi_range(0, winsize.y - target_size.y))
	print("gen'd pos ", pos)
	return pos

func _ready():
	var new_pos = get_new_target_pos()
	bad_target.position = new_pos

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and (mouse_targeted_target or mouse_targeted_bad_target):
			var new_pos = get_new_target_pos()
			if (mouse_targeted_target): # good target
				print("yes")
				target.position = new_pos;
				wins += 1
			elif (mouse_targeted_bad_target): # bad target
				bad_target.position = new_pos
				lives -= 1
				print("Don't kill friendlies! Lives: ", lives)
				if lives <= 0:
					print("You died!")
					lives = 3
					get_tree().reload_current_scene()

func _on_target_mouse_entered():
	mouse_targeted_target = true

func _on_target_mouse_exited():
	mouse_targeted_target = false

func _on_bad_target_mouse_entered():
	mouse_targeted_bad_target = true

func _on_bad_target_mouse_exited():
	mouse_targeted_bad_target = false

