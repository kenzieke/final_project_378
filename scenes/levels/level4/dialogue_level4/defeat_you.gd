class_name DefeatYou
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button

@export var level4 = preload("res://scenes/levels/level4/level4.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(level4)

func _process(_delta):
	pass
