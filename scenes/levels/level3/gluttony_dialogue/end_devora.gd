class_name EndDevora
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button

@export var credits = preload("res://scenes/mainmenu/end_scene.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(credits)

func _process(_delta):
	pass
