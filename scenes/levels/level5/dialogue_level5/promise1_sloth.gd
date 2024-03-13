class_name Promise1Sloth
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button
@export var promise2_sloth = preload("res://scenes/levels/level5/dialogue_level5/promise2_sloth.tscn") as PackedScene

func _ready():
	global.promise_sloth += 1
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(promise2_sloth)

func _process(_delta):
	pass
