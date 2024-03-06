class_name LastWrath
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/Next_Button as Button
@export var meet_devora = preload("res://scenes/levels/level3/gluttony_dialogue/dialogue1_3.tscn") as PackedScene

func _ready():
	next_button.button_down.connect(on_next_button_pressed)

func on_next_button_pressed() -> void:
	get_tree().change_scene_to_packed(meet_devora)
