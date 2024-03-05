class_name InHellDevora1
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button

@export var in_hell_devora2 = preload("res://scenes/levels/level3/gluttony_dialogue/in_hell_devora1.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(in_hell_devora2)

func _process(_delta):
	pass
