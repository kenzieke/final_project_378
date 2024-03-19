class_name Promise1
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button
@export var promise2_sloth = preload("res://scenes/levels/level6/dialogue_level6/post_game.tscn") as PackedScene

func _ready():
	global.promise_lust += 1
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(promise2_sloth)

func _process(_delta):
	pass
