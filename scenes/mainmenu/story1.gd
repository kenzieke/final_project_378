class_name Story1
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/Next_Button as Button
@export var story2_scene = preload("res://scenes/mainmenu/story2.tscn") as PackedScene


func _ready():
	next_button.button_down.connect(on_next_pressed)

func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(story2_scene)

func _process(_delta):
	pass
