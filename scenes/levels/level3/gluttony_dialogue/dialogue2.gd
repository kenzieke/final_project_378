class_name Dialogue2
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button

@export var level3 = preload("res://scenes/levels/level3/level3.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(level3)

func _process(_delta):
	pass
