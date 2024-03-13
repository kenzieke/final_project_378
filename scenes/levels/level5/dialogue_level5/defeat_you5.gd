class_name DefeatYou5
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button

@export var level5 = preload("res://scenes/levels/level5/level5.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(level5)

func _process(_delta):
	pass
