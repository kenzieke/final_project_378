class_name ReadyScene
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@export var start_level1 = preload("res://scenes/levels/level1/level_1.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.button_down.connect(on_start_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level1)
