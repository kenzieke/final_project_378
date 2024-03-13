class_name Promise2Hoardaxia
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button
@export var end_hoardaxia = preload("res://scenes/levels/level4/dialogue_level4/end_dialogue4.tscn") as PackedScene

func _ready():
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(end_hoardaxia)

func _process(_delta):
	pass
