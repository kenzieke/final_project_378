class_name LikeCircus6
extends Control

@onready var promise_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Promise_Button as Button
@onready var friend_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Friend_Button as Button
@export var promise1 = preload("res://scenes/levels/level6/dialogue_level6/promise1.tscn") as PackedScene
@export var friend = preload("res://scenes/levels/level6/dialogue_level6/friend.tscn") as PackedScene

func _ready():
	promise_button.button_down.connect(on_promise_button_pressed)
	friend_button.button_down.connect(on_friend_button_pressed)

func on_promise_button_pressed() -> void:
	get_tree().change_scene_to_packed(promise1)
	
func on_friend_button_pressed() -> void:
	get_tree().change_scene_to_packed(friend)

func _process(_delta):
	pass
