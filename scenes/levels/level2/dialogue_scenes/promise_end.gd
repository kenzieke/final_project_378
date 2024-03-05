class_name PromiseEnd
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/Next_Button as Button
@export var level2 = preload("res://scenes/levels/level2/level2.tscn") as PackedScene

func _ready():
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(level2)

func _process(_delta):
	pass
