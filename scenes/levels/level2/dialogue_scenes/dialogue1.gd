class_name Dialogue1
extends Control

@onready var no_fear_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/No_Fear_Button as Button
@onready var fear_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Fear_Button as Button

@export var fear_scene = preload("res://scenes/levels/level2/dialogue_scenes/fear_scene.tscn") as PackedScene
@export var no_fear_scene = preload("res://scenes/levels/level2/dialogue_scenes/no_fear_scene.tscn") as PackedScene


func _ready():
	no_fear_button.button_down.connect(on_no_fear_pressed)
	fear_button.button_down.connect(on_fear_pressed)

func on_no_fear_pressed() -> void:
	get_tree().change_scene_to_packed(no_fear_scene)
	
func on_fear_pressed() -> void:
	get_tree().change_scene_to_packed(fear_scene)

func _process(_delta):
	pass
