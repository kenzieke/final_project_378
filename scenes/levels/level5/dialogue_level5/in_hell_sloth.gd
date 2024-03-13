class_name InHellSloth
extends Control

@onready var question_1_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question1_Button as Button
@onready var question_2_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question2_Button as Button

@export var like_circus = preload("res://scenes/levels/level5/dialogue_level5/like_circus_sloth.tscn") as PackedScene
@export var leave_circus = preload("res://scenes/levels/level5/dialogue_level5/leave_circus_sloth.tscn") as PackedScene

func _ready():
	question_1_button.button_down.connect(on_like_circus_pressed)
	question_2_button.button_down.connect(on_leave_circus_pressed)

func on_like_circus_pressed() -> void:
	get_tree().change_scene_to_packed(like_circus)
	
func on_leave_circus_pressed() -> void:
	get_tree().change_scene_to_packed(leave_circus)

func _process(_delta):
	pass
