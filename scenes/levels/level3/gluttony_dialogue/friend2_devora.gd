class_name Friend2Devora
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button
@export var end_devora = preload("res://scenes/levels/level3/gluttony_dialogue/end_devora.tscn") as PackedScene

func _ready():
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(end_devora)

func _process(_delta):
	pass
