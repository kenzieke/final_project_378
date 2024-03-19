class_name PostGame
extends Control

@onready var question_1_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question1_Button as Button
@onready var question_2_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question2_Button as Button

@export var in_hell = preload("res://scenes/levels/level6/dialogue_level6/in_hell.tscn") as PackedScene
@export var know_meph = preload("res://scenes/levels/level6/dialogue_level6/know_meph.tscn") as PackedScene

func _ready():
	question_1_button.button_down.connect(on_hell_pressed)
	question_2_button.button_down.connect(on_know_meph_pressed)

func on_hell_pressed() -> void:
	get_tree().change_scene_to_packed(in_hell)
	
func on_know_meph_pressed() -> void:
	get_tree().change_scene_to_packed(know_meph)

func _process(_delta):
	pass
