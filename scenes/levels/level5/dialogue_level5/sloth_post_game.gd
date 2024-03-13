class_name SlothPostGame
extends Control

@onready var question_1_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question1_Button as Button
@onready var question_2_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question2_Button as Button

@export var in_hell_hoardaxia = preload("res://scenes/levels/level4/dialogue_level4/in_hell_hoardaxia.tscn") as PackedScene
@export var know_meph_hoardaxia = preload("res://scenes/levels/level4/dialogue_level4/know_meph_hoardaxia.tscn") as PackedScene

func _ready():
	question_1_button.button_down.connect(on_hell_hoardaxia_pressed)
	question_2_button.button_down.connect(on_know_meph_hoardaxia)

func on_hell_hoardaxia_pressed() -> void:
	get_tree().change_scene_to_packed(in_hell_hoardaxia)
	
func on_know_meph_hoardaxia() -> void:
	get_tree().change_scene_to_packed(know_meph_hoardaxia)

func _process(_delta):
	pass
