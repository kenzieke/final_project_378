class_name EndLevel1Scene
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@export var rule_pressed_screen = preload("res://scenes/levels/level1/rule_pressed_level1.tscn") as PackedScene
@export var welcome_screen = preload("res://scenes/levels/level1/welcome_screen.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.button_down.connect(on_start_pressed)

func on_start_pressed() -> void:
	# this is broken
	if global.rule_scene == 1:
		get_tree().change_scene_to_packed(rule_pressed_screen)
	# this works
	else:
		get_tree().change_scene_to_packed(welcome_screen)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
