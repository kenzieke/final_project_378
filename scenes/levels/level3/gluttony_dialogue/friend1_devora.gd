class_name Friend1Devora
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button
@export var friend2_devora = preload("res://scenes/levels/level3/gluttony_dialogue/friend2_devora.tscn") as PackedScene

func _ready():
	global.friend_devora += 1
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(friend2_devora)

func _process(_delta):
	pass
