class_name Promise2Sloth
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button
@export var end = preload("res://scenes/levels/level5/dialogue_level5/end_dialogue5.tscn") as PackedScene

func _ready():
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(end)

func _process(_delta):
	pass
