class_name NoFearScene
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/Next_Button as Button
@export var first_question = preload("res://scenes/levels/level2/dialogue_scenes/first_question_scene.tscn") as PackedScene

func _ready():
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(first_question)

func _process(_delta):
	pass
