class_name Promise1Hoardaxia
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button
@export var promise2_hoardaxia = preload("res://scenes/levels/level4/dialogue_level4/promise2_hoardaxia.tscn") as PackedScene

func _ready():
	global.promise_hoardaxia += 1
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(promise2_hoardaxia)

func _process(_delta):
	pass
