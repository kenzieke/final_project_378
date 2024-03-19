class_name Friend
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button
@export var end = preload("res://scenes/levels/level6/dialogue_level6/end_dialogue6.tscn") as PackedScene

func _ready():
	global.friend_lust += 1
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(end)

func _process(_delta):
	pass
