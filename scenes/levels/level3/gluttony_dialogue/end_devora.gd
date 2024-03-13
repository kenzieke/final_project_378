class_name EndDevora
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button

@export var hoardaxia_intro = preload("res://scenes/levels/level4/dialogue_level4/dialogue1_4.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(hoardaxia_intro)

func _process(_delta):
	pass
