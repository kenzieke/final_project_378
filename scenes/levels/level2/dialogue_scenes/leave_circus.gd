class_name LeaveCircus
extends Control

@onready var promise_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Promise_Button as Button
@onready var friend_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Friend_Button as Button
@export var promise1 = preload("res://scenes/levels/level2/dialogue_scenes/promise_wrath.tscn") as PackedScene
@export var friend1 = preload("res://scenes/levels/level2/dialogue_scenes/friend_wrath.tscn") as PackedScene

func _ready():
	promise_button.button_down.connect(on_promise_button_pressed)
	friend_button.button_down.connect(on_friend_button_pressed)

func on_promise_button_pressed() -> void:
	get_tree().change_scene_to_packed(promise1)
	
func on_friend_button_pressed() -> void:
	get_tree().change_scene_to_packed(friend1)

func _process(_delta):
	pass
