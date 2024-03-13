class_name SlothPostGame
extends Control

@onready var question_1_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question1_Button as Button
@onready var question_2_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question2_Button as Button

@export var in_hell = preload("res://scenes/levels/level5/dialogue_level5/in_hell_sloth.tscn") as PackedScene
@export var know_meph = preload("res://scenes/levels/level5/dialogue_level5/know_meph_sloth.tscn") as PackedScene

func _ready():
	question_1_button.button_down.connect(on_hell_pressed)
	question_2_button.button_down.connect(on_know_meph_pressed)

func on_hell_pressed() -> void:
	get_tree().change_scene_to_packed(in_hell)
	
func on_know_meph_pressed() -> void:
	get_tree().change_scene_to_packed(know_meph)

func _process(_delta):
	pass
