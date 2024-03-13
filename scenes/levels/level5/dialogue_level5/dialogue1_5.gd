class_name Dialogue1_5
extends Control

@onready var learn_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Learn_Button as Button
@onready var defeat_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Defeat_Button as Button

@export var LEARN_FROM = preload("res://scenes/levels/level5/dialogue_level5/learn_from5.tscn") as PackedScene
@export var DEFEAT_YOU = preload("res://scenes/levels/level5/dialogue_level5/defeat_you5.tscn") as PackedScene

func _ready():
	learn_button.button_down.connect(on_learn_pressed)
	defeat_button.button_down.connect(on_defeat_pressed)

func on_learn_pressed() -> void:
	get_tree().change_scene_to_packed(LEARN_FROM)
	
func on_defeat_pressed() -> void:
	get_tree().change_scene_to_packed(DEFEAT_YOU)

func _process(_delta):
	pass
