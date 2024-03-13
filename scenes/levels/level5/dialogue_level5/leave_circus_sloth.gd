class_name LeaveCircusSloth
extends Control

@onready var promise_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Promise_Button as Button
@onready var friend_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Friend_Button as Button
@export var promise1 = preload("res://scenes/levels/level5/dialogue_level5/promise1_sloth.tscn") as PackedScene
@export var friend = preload("res://scenes/levels/level5/dialogue_level5/friend_sloth.tscn") as PackedScene

func _ready():
	promise_button.button_down.connect(on_promise_button_pressed)
	friend_button.button_down.connect(on_friend_button_pressed)

func on_promise_button_pressed() -> void:
	get_tree().change_scene_to_packed(promise1)
	
func on_friend_button_pressed() -> void:
	get_tree().change_scene_to_packed(friend)

func _process(_delta):
	pass
