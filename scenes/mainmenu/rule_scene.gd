class_name RuleScene
extends Control

@onready var ready_button = $MarginContainer/HBoxContainer/VBoxContainer/Ready_Button as Button
@export var ready_scene = preload("res://scenes/mainmenu/ready_scene.tscn") as PackedScene


func _ready():
	global.rule_scene = 1
	ready_button.button_down.connect(on_ready_pressed)

func on_ready_pressed() -> void:
	get_tree().change_scene_to_packed(ready_scene)

func _process(_delta):
	pass
