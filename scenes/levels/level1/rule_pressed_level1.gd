class_name RulePressedLevel1
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@export var welcome_screen = preload("res://scenes/levels/level1/welcome_screen.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.button_down.connect(on_start_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(welcome_screen)
