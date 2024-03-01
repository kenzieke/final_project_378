class_name WelcomeScreen
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@export var meet_acheron = preload("res://scenes/levels/level2/dialogue_scenes/dialogue1.tscn") as PackedScene


func _ready():
	start_button.button_down.connect(on_start_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(meet_acheron)

func _process(_delta):
	pass
