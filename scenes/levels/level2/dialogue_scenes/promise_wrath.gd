class_name PromiseWrath
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/Next_Button as Button
@export var promise_wrath2 = preload("res://scenes/levels/level2/dialogue_scenes/promise_end.tscn") as PackedScene

func _ready():
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(promise_wrath2)

func _process(_delta):
	pass
