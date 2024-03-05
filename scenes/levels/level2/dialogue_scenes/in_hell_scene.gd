class_name InHellScene
extends Control

@onready var like_circus_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question1_Button as Button
@onready var leave_circus_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question2_Button as Button
@export var like_circus_scene = preload("res://scenes/levels/level2/dialogue_scenes/like_circus.tscn") as PackedScene
@export var leave_circus_scene = preload("res://scenes/levels/level2/dialogue_scenes/leave_circus.tscn") as PackedScene

func _ready():
	like_circus_button.button_down.connect(on_like_circus_button_pressed)
	leave_circus_button.button_down.connect(on_leave_circus_button_pressed)

func on_like_circus_button_pressed() -> void:
	get_tree().change_scene_to_packed(like_circus_scene)
	
func on_leave_circus_button_pressed() -> void:
	get_tree().change_scene_to_packed(leave_circus_scene)

func _process(_delta):
	pass
