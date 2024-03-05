class_name FriendWrath
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/Next_Button as Button
@export var friend2 = preload("res://scenes/levels/level2/dialogue_scenes/friend_wrath2.tscn") as PackedScene

func _ready():
	global.friend_wrath += 1
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(friend2)

func _process(_delta):
	pass
